//
//  ContentView.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 30. 10. 2025..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            Tab(Constants.Tab.home , systemImage:Constants.Icon.home){
                HomeView()
                
            }
            Tab(Constants.Tab.upcoming , systemImage:Constants.Icon.upcoming){
                Text(Constants.Tab.upcoming)
                
            }
            Tab(Constants.Tab.search, systemImage:Constants.Icon.search){
                Text(Constants.Tab.search)
                
            }
            Tab(Constants.Tab.downloads, systemImage:Constants.Icon.downloads){
                Text(Constants.Tab.downloads)
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
