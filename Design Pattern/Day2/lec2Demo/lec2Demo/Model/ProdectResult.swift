//
//  ProdectResult.swift
//  lec2Demo
//
//  Created by Usef on 23/01/2025.
//

import Foundation
class ProdectResult: Decodable {
    var products: [Product]?
    var total:Int?
    var skip:Int?
    var limit:Int?
}

class Product: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var humbnail: String?
}
