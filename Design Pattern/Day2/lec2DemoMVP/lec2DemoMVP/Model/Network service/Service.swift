//
//  Service.swift
//  lec2Demo
//
//  Created by Usef on 23/01/2025.
//

import Foundation
protocol NetworkProtocol {
    static func fetchDataFromJson(compilitionHandler : @escaping(ProdectResult?) -> Void)
}
class Service : NetworkProtocol{
    static func fetchDataFromJson(compilitionHandler : @escaping(ProdectResult?) -> Void){
        let url = URL(string: "https://dummyjson.com/products")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, request, error in
            guard let data = data else {
                return
            }
            do{
                let result = try JSONDecoder().decode(ProdectResult.self, from: data)
                compilitionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                compilitionHandler(nil)
            }
        }
        task.resume()
    }
}
