//
//  ReachabilityHelper.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit
import Reachability
class ReachabilityHelper {
    public static let sharedInstance = ReachabilityHelper()
    public static var Delegete:ReachalbiltyDelegete!
    private let reachability = try! Reachability()
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
    }
    func start(){
        do{
          try reachability.startNotifier()
        }catch{
          print("could not start reachability notifier")
        }
    }
    @objc func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability
      switch reachability.connection {
      case .wifi:
          print("Reachable via WiFi")
          APIConnectionHelper.sharedInstance.fethAPIData()
      case .cellular:
          print("Reachable via Cellular")
          APIConnectionHelper.sharedInstance.fethAPIData()
      case .unavailable:
        print("Network not reachable")
          ReachabilityHelper.Delegete.retrieveLocalData()
          ReachabilityHelper.Delegete.showAlert()
      }
    }
}
