//
//  Movie.swift
//  task1
//
//  Created by Uef on 11/01/2025.
//

import UIKit

class Movie: NSObject {
    var title       = ""
    var rating      = 0.0
    var releaseYear = 0
    var genre       = ""
    var image       = ""

    init(title: String , rating: Double , releaseYear: Int , genre: String , image: String ) {
        self.title          = title
        self.rating         = rating
        self.releaseYear    = releaseYear
        self.genre          = genre
        self.image          = image
    }
}
