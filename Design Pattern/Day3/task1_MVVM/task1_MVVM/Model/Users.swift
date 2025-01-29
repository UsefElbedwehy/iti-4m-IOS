//
//  Users.swift
//  task1_MVVM
//
//  Created by Usef on 27/01/2025.
//

import Foundation
class Users : Decodable {
    var users:[User]?
    var total:Int?
    var skip:Int?
    var limit:Int?
}

class User : Decodable {
    var firstName:String?
    var lastName:String?
    var maidenName:String?
    var email:String?
    var phone:String?
    var image:String?
}
