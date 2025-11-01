//
//  HomeVIew.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 30. 10. 2025..
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.URL.testTitleUrl
    let viewModel = ViewModel()
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                switch viewModel.homeStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    VStack(spacing: 12) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.2)
                        Text("Loading…")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }.frame(width: geo.size.width , height: geo.size.height)
                    
                    
                case .success:
                    LazyVStack {
                        AsyncImage(url: URL(string: heroTestTitle)){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .clear , location: 0.8),
                                            Gradient.Stop(color: .gradiants, location: 1.0)
                                        ], startPoint: .top, endPoint: .bottom
                                    )
                                    
                                }
                            
                        } placeholder:{
                            ProgressView()
                        }
                        .frame(width: geo.size.width , height: geo.size.height * 0.85)
                        
                        HStack{
                            Button{
                                
                            } label :{
                                
                                Text(Constants.Tab.playString)
                                    .ghostButton()
                            }
                            Button {
                                
                                
                            }label: {
                                Text(Constants.Tab.downloads)
                                    .ghostButton()
                            }
                        }
                        HorizontalListView(header: Constants.Tab.trendingMovieString, titles: viewModel.trendingMovies)
                        HorizontalListView(header: Constants.Tab.trendingTVString, titles: viewModel.trendingTV )
                        HorizontalListView(header: Constants.Tab.topRatedMovieString, titles: viewModel.topRatedMovies)
                        HorizontalListView(header: Constants.Tab.topRatedTVString, titles: viewModel.topRatedTV)
                        
                        
                    }
                case .failed(let error):
                    Text(verbatim: "Error: \(error.localizedDescription)")
                    
                }
                
            }
            .task {
                await viewModel.getTitels()
            }
        }
    }
}

#Preview {
    HomeView()
}
