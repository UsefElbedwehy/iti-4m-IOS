//
//  Product.swift
//  task1_MVC
//
//  Created by Usef on 23/01/2025.
//

import Foundation

class Product : Decodable {
    var products: [ProductResult]?
    var total:Int?
    var skip:Int?
    var limit:Int?
}

class ProductResult: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var thumbnail: String?
}
