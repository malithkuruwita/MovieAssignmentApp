//
//  Movie.swift
//  MovieAssignmentApp
//
//  Created by Malith on 2/24/20.
//  Copyright © 2020 Malith. All rights reserved.
//

import Foundation

struct Movie: Codable  {
    let Search: [Movies]
    
    init(movies: [Movies]) {
        self.Search = movies
    }
}

struct Movies: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let Poster: URL
    
    init(Title: String, Year: String, imdbID: String, Poster: URL) {
        self.Title = Title
        self.Year = Year
        self.imdbID = imdbID
        self.Poster = Poster
    }
}
