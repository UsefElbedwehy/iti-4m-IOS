//
//  Movie1.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit

class Movie1 {
    var title       = ""
    var rating      = 0.0
    var releaseYear = 0
    var genre       = ""
    var image       = ""
    init() {
        
    }
    init(title: String , rating: Double , releaseYear: Int , genre: String ,image : String ) {
        self.title          = title
        self.rating         = rating
        self.releaseYear    = releaseYear
        self.genre          = genre
        self.image          = image
    }
}
