//
//  Presenter.swift
//  lec2DemoMVP
//
//  Created by Usef on 23/01/2025.
//

import Foundation
class Presenter {
    //view
    var view : HomeProtocol!
    
    func attachView(view : HomeProtocol){
        self.view = view
    }
    
    
    //Model
    func getData(){
        Service.fetchDataFromJson { res in
            self.view.renderToView(res: res!)
        }
    }
}
