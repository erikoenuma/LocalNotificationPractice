//
//  AppDelegate.swift
//  LocalNotificationPractice
//
//  Created by 肥沼英里 on 2021/06/05.
//

import UIKit
import UserNotifications

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //デリゲートを設定
        UNUserNotificationCenter.current().delegate = self
        Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //バックグラウンド通知
        //アプリ開いてる時は呼ばれない
        for request in AlertModel.shared.backgroundRequest{
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    print("バックグラウンド通知作成成功！")
                }
            }
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate{

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .list])
    }
}
