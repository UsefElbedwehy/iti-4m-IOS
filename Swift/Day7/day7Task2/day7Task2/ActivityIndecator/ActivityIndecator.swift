//
//  ActivityIndecator.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit

class ActivityIndecator {
    public static let sharedInstance = ActivityIndecator()
    public static var  delegete:ActivityIndicatorDelegete!
    let indecator:UIActivityIndicatorView!
    
    private init() {
        indecator = UIActivityIndicatorView(style: .large)
    }
    static func start(){
        delegete.startIndicator()
    }
    static func stop(){
        delegete.stopIndicator()
    }
}
