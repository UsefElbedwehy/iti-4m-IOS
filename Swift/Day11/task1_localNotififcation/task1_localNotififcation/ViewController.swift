//
//  ViewController.swift
//  task1_localNotififcation
//
//  Created by Usef on 21/01/2025.
//

import UIKit

class ViewController: UIViewController ,UNUserNotificationCenterDelegate{

    let userNotificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNotificationCenter.delegate = self
    }

    @IBAction func setReminder(_ sender: UIButton) {
        sendReminderNotification()
    }
    @IBAction func setTimeout(_ sender: UIButton) {
        sendTimeoutNotification()
    }
    func sendTimeoutNotification() {
        let notificationCotent = UNMutableNotificationContent()
        notificationCotent.title = "Timeout"
        notificationCotent.body = "10 seconds timeout notification!"
        notificationCotent.badge = NSNumber(value: 1)
        
        if let url = Bundle.main.url(forResource: "coffee", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "1", url: url, options: nil){
                notificationCotent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timeout test", content: notificationCotent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }else{
                print("Notification scheduled successfully")
            }
        }
    }
    func sendReminderNotification() {
        let notificationCotent = UNMutableNotificationContent()
        notificationCotent.title = "Reminder"
        notificationCotent.body = "you have to eat now!"
        notificationCotent.badge = NSNumber(value: 2)
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        var dateComponent = DateComponents()
        dateComponent.hour = hour
        dateComponent.minute = minute
        dateComponent.second = second + 5
        
        if let url = Bundle.main.url(forResource: "coffee", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "1", url: url, options: nil){
                notificationCotent.attachments = [attachment]
            }
        }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder test", content: notificationCotent, trigger: trigger)
        
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

