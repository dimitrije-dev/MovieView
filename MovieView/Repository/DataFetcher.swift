//
//  DataFetcher.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 31. 10. 2025..
//

import Foundation
// Foundation provides core data types (URL, Data), networking (URLSession), and JSON utilities (JSONDecoder).


struct DataFetcher {
    
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    // Reads the TMDB base URL from a shared configuration singleton. Optional because config may be missing at runtime.
    
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    // Reads the API key used for authenticating requests to TMDB. Kept out of source via config.
    
    func fetchTitles (for media:String , by type:String) async throws -> [Title] {
        

        let fetchTitlesURL = try buildURL(media: media, type: type)
        
        guard let fetchTitlesURL = fetchTitlesURL else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL)
        
        let (data,urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse , response.statusCode == 200 else{
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Bad URL Response"]))
        }
        // Validate we received an HTTP response with status 200 (OK).
        // If not, wrap the status code in a domain-specific NetworkError for easier debugging and handling upstream.
        
        let decoder = JSONDecoder()
        // JSONDecoder converts raw JSON bytes into strongly-typed Swift models.
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        // Matches TMDB's snake_case keys to Swift's camelCase properties automatically.
        
        
        var titles = try decoder.decode(APIObject.self, from: data).results
        // Decode the top-level TMDB payload into APIObject, then extract the array of titles.
        Constants.URL.addPosterPath(to: &titles)
        
        return titles
    }
    
    private func buildURL(media:String , type:String) throws -> URL? {
        guard let baseURL = tmdbBaseURL else{
            throw NetworkError.missingConfig
        }
        
        guard let apiKey = tmdbAPIKey else{
            throw NetworkError.missingConfig
        }
        
        
        var path:String
        
        if type == "trending"{
            path = "3/trending/\(media)/day"
        }else if type == "top_rated"{
            path = "3/\(media)/top_rated"
        }else {
            throw NetworkError.urlBuildFailed
        }
        
        guard let url = URL(string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ])else{
            throw NetworkError.urlBuildFailed
        }
        
        return url
    }
}
