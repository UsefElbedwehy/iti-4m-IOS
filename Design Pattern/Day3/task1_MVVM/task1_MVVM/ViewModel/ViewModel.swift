//
//  ViewModel.swift
//  task1_MVVM
//
//  Created by Usef on 27/01/2025.
//

import Foundation
class ViewModel {
    
    var bindresultToViewController : (()->()) = {}
    
    var finalResult : [User]! {
        didSet {
            bindresultToViewController()
        }
    }
    
    func getDataFromModel() {
        Service.FetchDataFromJson { result in
            self.finalResult = result?.users
        }
    }
}
