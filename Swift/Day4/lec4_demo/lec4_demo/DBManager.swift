//
//  DBManager.swift
//  lec4_demo
//
//  Created by Uef on 12/01/2025.
//

import Foundation
class DBManager {
    static let sharedResource = DBManager()
    private init() {
        print("This is a private init")
    }
}
