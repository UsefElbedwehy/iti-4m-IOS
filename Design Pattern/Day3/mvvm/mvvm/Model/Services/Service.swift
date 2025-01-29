//
//  Service.swift
//  mvvm
//
//  Created by Usef on 27/01/2025.
//

import Foundation

protocol NetworkService {
    static func FetchDataFromJson(compiltitionHandler: @escaping (ProductResult?) -> Void )
}

class Service : NetworkService{
    static func FetchDataFromJson(compiltitionHandler: @escaping (ProductResult?) -> Void) {
        let url = URL(string: "https://dummyjson.com/products")
//        let url = URL(string: "GET/POST https://apiv2.allsportsapi.com/basketball/?met=Countries&1bdf9ca0bb2950913f68e460c14c228d8775b1266523146f4c14f76ea04b5678")
        guard let url = url else {
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
        
        do{
            let result = try JSONDecoder().decode(ProductResult.self, from: data)
            compiltitionHandler(result)
        }catch let error{
            print(error.localizedDescription)
        }
        }
        task.resume()
    }
    
    
}
