//
//  Users.swift
//  Lec2Task2
//
//  Created by Usef on 10/02/2025.
//

import Foundation
struct User: Codable, Identifiable {
    let id: String
    let name: String
    let about: String
    let email: String
}
