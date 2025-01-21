//
//  ViewController.swift
//  lec11Demo
//
//  Created by Usef on 21/01/2025.
//

import UIKit

class ViewController: UIViewController , UNUserNotificationCenterDelegate{
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNotificationCenter.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func sendNotification(_ sender: UIButton) {
        let notificationCotent = UNMutableNotificationContent()
        notificationCotent.title = "Demo11"
        notificationCotent.body = "Notification Demo"
        notificationCotent.badge = NSNumber(value: 1)
        userNotificationCenter.delegate = self
        
        if let url = Bundle.main.url(forResource: "coffee", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "1", url: url, options: nil){
                notificationCotent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification test", content: notificationCotent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }else{
                print("Notification scheduled successfully")
            }
        }
        
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print("received noti")
        let sVC = self.storyboard?.instantiateViewController(identifier: "secondVC") as! secondViewController
        self.navigationController?.pushViewController(sVC, animated: true)
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
        print("presented")
    }

}

