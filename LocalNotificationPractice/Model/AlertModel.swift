//
//  AlertModel.swift
//  LocalNotificationPractice
//
//  Created by 肥沼英里 on 2021/06/05.
//

import Foundation
import UserNotifications

final class AlertModel{
    private init(){}
    static let shared = AlertModel()
    private (set) var backgroundRequest: [UNNotificationRequest] = []
    
    //一度きり、5秒後に発火
    func makeForegroundAlert(){
        let contents = UNMutableNotificationContent()
        contents.title = "一回きりだよ"
        contents.body = "5秒経ったよ"
        contents.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "5seconds",
                                            content: contents,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("アラート作成成功！")
            }
        }
    }
    
    //繰り返し毎日19時にアラートしてくれる　バックグラウンドのみ
    func makeBackgroundAlert(){
        var components = DateComponents()
        components.hour = 19
        components.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let content = UNMutableNotificationContent()
        content.body = "夜ご飯できたよ"
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(identifier: "dinner",
                                            content: content,
                                            trigger: trigger)
        // 通知を配列に保存
        backgroundRequest.append(request)
    }
}
