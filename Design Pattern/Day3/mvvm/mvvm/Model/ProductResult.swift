//
//  ProductResult.swift
//  mvvm
//
//  Created by Usef on 27/01/2025.
//

import Foundation
struct ProductResult : Decodable{
    var products: [Product]?
    var total:Int?
    var skip:Int?
    var limit:Int?
}

struct Product : Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var thumbnail: String?
}

