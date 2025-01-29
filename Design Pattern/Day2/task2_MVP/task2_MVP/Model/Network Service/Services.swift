//
//  Services.swift
//  task1_MVC
//
//  Created by Usef on 23/01/2025.
//

import Foundation

protocol ApiProtocol {
    static func fetchDataFromJson(compilationHandler : @escaping(FootBallSport?) -> Void)
}

class Services : ApiProtocol{
    static func fetchDataFromJson(compilationHandler: @escaping(FootBallSport?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=1bdf9ca0bb2950913f68e460c14c228d8775b1266523146f4c14f76ea04b5678")

        guard let url = url else {
            return
        }
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                compilationHandler(nil)
                return
            }
            
            guard let data = data else {
                print("No data received from server.")
                compilationHandler(nil)
                return
            }
            
            // Debug: Print raw data as a string
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }
            
            do {
                let result = try JSONDecoder().decode(FootBallSport.self, from: data)
                compilationHandler(result)
            } catch let decodingError {
                print("Decoding Error: \(decodingError.localizedDescription)")
                compilationHandler(nil)
            }
        }

        
        task.resume()
        
    }
    
    
}
