//
//  Services.swift
//  task1_MVC
//
//  Created by Usef on 23/01/2025.
//

import Foundation

protocol ApiProtocol {
    static func fetchDataFromJson(compilationHandler : @escaping(Product?) -> Void)
}

class Services : ApiProtocol{
    static func fetchDataFromJson(compilationHandler: @escaping(Product?) -> Void) {
        let url = URL(string: "https://dummyjson.com/products")
        guard let url = url else {
            return
        }
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, request, error in
            do{
                let result = try JSONDecoder().decode(Product.self, from: data!)
                compilationHandler(result)
            }catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
    
    
}
