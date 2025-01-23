//
//  Presenter.swift
//  task2_MVP
//
//  Created by Usef on 23/01/2025.
//

import Foundation
class Presenter {
    
    
    //view
    var view: HomeProtocol?
    func attachView(view : HomeProtocol){
        self.view = view
    }
    
    
    //model
    func getDataFromModel(){
        Services.fetchDataFromJson { res in
            self.view?.renderToView(res: res!)
        }
    }
}
