//
//  Service.swift
//  task1_MVVM
//
//  Created by Usef on 27/01/2025.
//

import Foundation

protocol NetworkService {
    static func FetchDataFromJson(compiltitionHandler: @escaping (Users?) -> Void )
}

class Service : NetworkService {
    static func FetchDataFromJson(compiltitionHandler: @escaping (Users?) -> Void) {
        let url = URL(string: "https://dummyjson.com/users")
        guard let url = url else {return}
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do{
                let result = try JSONDecoder().decode(Users.self, from: data)
                compiltitionHandler(result)
            }catch let error {
                print("any")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
