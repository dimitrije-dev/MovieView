//
//  Title.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 31. 10. 2025..
//

import Foundation

struct APIObject : Decodable{
    var results : [Title] = []
}

struct Title: Decodable, Identifiable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "A movie about BeetleJuice", posterPath: Constants.URL.testTitleUrl),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview: "A movie about Pulp FIction", posterPath: Constants.URL.testTitleUrl2),
        Title(id: 3, title: "The Dark Knight", name: "The Dark Knight", overview: "A movie about The Dark Knight", posterPath: Constants.URL.testTitleUrl3)

    ]
}
