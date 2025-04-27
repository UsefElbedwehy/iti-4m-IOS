//
//  Users.swift
//  RxSwift_Demo1
//
//  Created by Usef on 17/02/2025.
//

import Foundation

class Users: Codable {
    var users: [User]?
}
class User: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
}

class Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

class Geo: Codable {
     let lat: String?
     let lng: String?
}
