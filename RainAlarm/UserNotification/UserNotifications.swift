//
//  UserNotifications.swift
//  RainAlarm
//
//  Created by artem on 18.02.2023.
//

import UIKit
import UserNotifications

class UserNotifications: NSObject {
    static let shared = UserNotifications()
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {
            success, error in
            if success {
                print("success")
            } else {
                guard let error = error else {return}
                print(error.localizedDescription)
            }
        })
    }
    
    func createNotification(timeInterval: Double, title: String, subtitle: String, body: String, sound: UNNotificationSound) {
        delateNotification()
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
    func delateNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

extension UserNotifications: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.banner, .badge, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Ви в додатку")
    }
}


