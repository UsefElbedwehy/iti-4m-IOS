//
//  APIConnectionHelper.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit

class APIConnectionHelper {
    public static var delegete:APIDelegete!
    public static var sharedInstance = APIConnectionHelper()
    private var url:URL!
    private var req:URLRequest!
    private var session:URLSession!
    private init(){
        ActivityIndecator.start()
        url = URL(string: "https://www.freetestapi.com/api/v1/movies")
        req = URLRequest(url: url)
        session = URLSession(configuration: .default)
    }
    func fethAPIData(){
        var movies = [Movie]()
        let task = session.dataTask(with: req) { data , req , error in
            do{
                movies = try JSONDecoder().decode([Movie].self, from: data!)
                    //calback function to set movies
                DispatchQueue.main.async{
                    APIConnectionHelper.delegete.retrieveMovies(movies)
                    ActivityIndecator.stop()
                    APIConnectionHelper.delegete.reloadTableViewData()
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
protocol ConnectionManagerProtocol {
    func loadDataFromApi(url:String , complilatioHandler:@escaping([Movie]?,Error?)->Void)
}
class ConnectionManager {
    
    func loadDataFromApi(url:String , complilatioHandler:@escaping([Movie]?,Error?)->Void) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data , req , error in
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data!)
                if let error = error {
                    print(error.localizedDescription)
                }else{
                    let result = try? JSONDecoder().decode([Movie].self, from: data!)
                    complilatioHandler(result!, nil)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
