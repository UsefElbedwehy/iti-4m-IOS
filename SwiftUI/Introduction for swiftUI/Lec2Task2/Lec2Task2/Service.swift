//
//  Service.swift
//  Lec2Task2
//
//  Created by Usef on 10/02/2025.
//

import Foundation


class Service {
    static let shared = Service()
    private init() {}
    
    let urlStr = "https://dl.dropboxusercontent.com/s/1y7yqdefyayegzo/employeelist.json?dl=0"
    
    func fetchData(completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: urlStr) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let result = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(result)
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
