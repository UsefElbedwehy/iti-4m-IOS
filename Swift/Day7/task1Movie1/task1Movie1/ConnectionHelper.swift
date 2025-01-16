//
//  ConnectionHelper.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit
import Reachability
class ConnectionHelper {
    public static let connectionSharedInstance = ConnectionHelper()
    public static var connDelegete:ConnectionDelegete!
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
          ConnectionHelper.connDelegete.loadData()
      case .cellular:
          print("Reachable via Cellular")
          ConnectionHelper.connDelegete.loadData()
      case .unavailable:
        print("Network not reachable")
          ConnectionHelper.connDelegete.showAlert()
      }
    }
}
