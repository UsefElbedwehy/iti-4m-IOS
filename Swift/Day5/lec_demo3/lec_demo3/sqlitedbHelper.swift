//
//  sqlitedbHelper.swift
//  lec_demo3
//
//  Created by Uef on 14/01/2025.
//

import Foundation
import SQLite3

let sqlPart1DB:String? = "test"
func openDataBase() -> OpaquePointer? {
    var dB: OpaquePointer?
    guard let sqlPart1DB = sqlPart1DB else {
        print("nil sqlPart1DB")
        return nil
    }
    if sqlite3_open(sqlPart1DB, &dB) == SQLITE_OK{
        return dB
    } else {
        print("cannot open sqllite")
        return nil
    }
}
let db = openDataBase()


