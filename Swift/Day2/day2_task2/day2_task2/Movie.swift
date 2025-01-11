//
//  Movie.swift
//  day2_task2
//
//  Created by Uef on 08/01/2025.
//

import UIKit

class Movie: NSObject {
    var title           = String()
    var image           = ""
    var rating          = 0.0
    var realeaseYear    = 0
    var genre           = [""]
    init(forTitle title: String,forImage image: String, forRating rating: Double, forRYear releaseYear: Int, forGenre genre: [String] ){
        self.title          = title
        self.image          = image
        self.rating         = rating
        self.realeaseYear   = releaseYear
        self.genre          = genre
    }
}
