//
//  FootBallSport.swift
//  task2_MVP
//
//  Created by Usef on 28/01/2025.
//

import Foundation
class FootBallSport : Decodable {
    var success: Int?
    var result:[FootBallLeague]?
}
class FootBallLeague : Decodable {
    var league_key:Int?
    var league_name:String?
    var country_key:Int?
    var country_name:String?
    var league_logo:String?
    var country_logo:String?
}
