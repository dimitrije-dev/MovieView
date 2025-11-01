//
//  Constants.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 30. 10. 2025..
//

import Foundation
import SwiftUI


struct Constants {
    enum Tab {
        
        static let home = "Home"
        static let search = "Search"
        static let upcoming = "Upcoming"
        static let downloads = "Downloads"
        static let playString  = "Play"
        static let trendingMovieString = "Trending Movies"
        static let trendingTVString = "Trending TV"
        static let topRatedMovieString = "Top Rated Movies"
        static let topRatedTVString = "Top Rated TV"
    }
    
    enum Icon{
        static let home = "house"
        static let upcoming = "play.circle"
        static let search = "magnifyingglass"
        static let downloads = "arrowshape.down.circle.fill"
    }
    
    enum URL{
        static let testTitleUrl = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
        static let testTitleUrl2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
        static let testTitleUrl3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
        
        static let posterURLStart = "https://image.tmdb.org/t/p/w500"
        
        static func addPosterPath(to titles : inout[Title]){
            for index in titles.indices{
                if let path = titles[index].posterPath{
                    titles[index].posterPath = Constants.URL.posterURLStart.appending(path)
                }
            }
        }
        
    }
    
    
    
}

extension Text{
    func ghostButton () -> some View {
        self
            .frame(width: 100,  height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .glassEffect(.regular.tint(.purple).interactive())
    }
}

