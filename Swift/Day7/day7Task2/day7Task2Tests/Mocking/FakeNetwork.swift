//
//  FakeNetwork.swift
//  day7Task2Tests
//
//  Created by Usef on 01/02/2025.
//

import Foundation
@testable import day7Task2

class FakeNetwork {
    let shouldReturnError:Bool
//    let newJsonResponse : [String: Any] = ["id":1,
//        "title":"The Shawshank Redemption","year":1994,"genre":["Drama"],"rating":9.3,"director":"Frank Darabont","actors":["Tim Robbins","Morgan Freeman"],"plot":"Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.","poster":"https://fakeimg.pl/220x310/ff0000","trailer":"https://example.com/shawshank_redemption_trailer.mp4","runtime":142,"awards":"Nominated for 7 Oscars","country":"USA","language":"English","boxOffice":"$28.3 million","production":"Columbia Pictures","website":"http://www.warnerbros.com/movies/shawshank-redemption"]
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    enum ResponseWithError: Error{
        case responseError
    }
}

extension FakeNetwork{
    func loadDataFromApi(url:String , complilatioHandler:@escaping([Movie]?,Error?)->Void)
    {
        if
            shouldReturnError{ //offline
            //error in API
            complilatioHandler(nil, ResponseWithError.responseError)
        }else{
            // function pass
            let moviesArr = [Movie]()
            complilatioHandler(moviesArr , nil)
        }
    }
}
