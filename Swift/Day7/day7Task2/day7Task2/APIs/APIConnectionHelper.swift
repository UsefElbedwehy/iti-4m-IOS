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
