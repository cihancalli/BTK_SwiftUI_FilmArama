//
//  FilmModel.swift
//  FilmAramaSwiftUI
//
//  Created by Cihan on 19.03.2024.
//

import Foundation

struct FilmModel : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct GelenFilimlerModel : Codable {
    let filimler : [FilmModel]
    
    private enum CodingKeys: String, CodingKey {
        case filimler = "Search"
    }
}
