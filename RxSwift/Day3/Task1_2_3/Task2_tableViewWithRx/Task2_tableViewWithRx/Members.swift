//
//  Members.swift
//  Task2_tableViewWithRx
//
//  Created by Usef on 05/02/2025.
//

import Foundation
import RxCocoa
import RxSwift

class Members {
    let members = PublishSubject<[String]>()
    var membersArray    = ["Esraa Eid","Mona Ahmed","Ahmed Essam"]
    func fetchMembers() {
        membersArray    = ["Esraa Eid","Mona Ahmed","Ahmed Essam"]
        members.onNext(membersArray)
    }
    func fetchNewMwmbers() {
        membersArray = ["Esraa Eid","Mona Ahmed","Ahmed Essam","Ali Gamal"]
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.members.onNext(self.membersArray)
//            self.members.onCompleted()
        }
    }
        func removeMember() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.members.onNext(self.membersArray)
//                self.members.onCompleted()
            }
        
    }
}
