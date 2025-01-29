//
//  ViewModel.swift
//  mvvm
//
//  Created by Usef on 27/01/2025.
//

import Foundation
class ViewModel {
    
    var bindresultToViewController : (()->()) = {}
    
    var finalResult : [Product]! {
        didSet {
            bindresultToViewController()
        }
    }
    
    // call model
    func getDataFromModel() {
        Service.FetchDataFromJson { result in
            guard let result = result else {return}
            self.finalResult = result.products
        }
    }
    
    
    
}
