//
//  Movie.swift
//  Day6task1
//
//  Created by Usef on 15/01/2025.
//

import UIKit

class Movie : Codable {
    var id = 0
    var title = ""
    var year = 0
    var genre = [String]()
    var rating = 0.0
    var director = ""
    var actors = [String]()
    var plot = ""
    var poster = "" //url
    var trailer = "" //url mp4
    var runtime  = 0
    var awards = ""
    var country = ""
    var language = ""
    var boxOffice = ""
    var production = ""
    var website = ""
}
