//
//  ViewModel.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 31. 10. 2025..
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError : Error)
    }
    
    private(set) var homeStatus : FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    
    var trendingMovies : [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    
    
    func getTitels() async  {
        homeStatus = .fetching
        if trendingMovies.isEmpty{
            
            do{
                async let tMovies = try await dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = try await dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = try await dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = try await dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedTV = try await tRTV
                topRatedMovies = try await tRMovies
                homeStatus = .fetching
                
                
                homeStatus = .success
                
            }catch{
                
                print (error)
                homeStatus = .failed(underlyingError: error)
                
            }
        }else{
            homeStatus = .success
        }
        
    }
    
    func getOneTitle(forId: Int, type: String) async -> Title? {
        do{
            return try await dataFetcher.fetchTitles(for: type, by: "top_rated").first(where: { $0.id == forId })
        }catch{
            print (error)
            return nil
        }
    }
    
    
}

