//
//  User.swift
//  unitTestingTask1
//
//  Created by Usef on 29/01/2025.
//

import Foundation
struct User {
    var password : String
    var username : String
    
    init(password: String, username: String) {
        self.password = password
        self.username = username
    }
    
    func authentication() -> Bool {
        if username.count > 5 && password.count >= 10 {
            return true
        }else{
            return false
        }
    }
    
    
}
