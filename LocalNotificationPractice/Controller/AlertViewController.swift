//
//  AlertViewController.swift
//  LocalNotificationPractice
//
//  Created by 肥沼英里 on 2021/06/05.
//

import UIKit
import UserNotifications

final class AlertViewController: UIViewController {

    @IBOutlet private weak var foregroundAlertButton: UIButton!
    @IBOutlet private weak var backgroundAlertButton: UIButton!
    @IBOutlet private weak var pendingAlertButton: UIButton!
    @IBOutlet private weak var deliveredAlertButton: UIButton!
    @IBOutlet private weak var deletePendingAlertButton: UIButton!
    @IBOutlet private weak var deleteDeleveredAlertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
        setUpButtons()
    }
    
    //許可されてるか許可されてないか勝手に判断してくれる
    private func requestAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert]) { [weak self] (granted, error) in
            if error != nil {
                print(error!)
                return
            }
            if granted {
                print("許可されました")
            } else {
                UIAlertController.showAlert(message: "通知が許可されませんでした。", self!)
            }
        }
    }
    
    private func setUpButtons(){
        foregroundAlertButton.addTarget(self, action: #selector(didTapForegroundAlertButton), for: .touchUpInside)
        backgroundAlertButton.addTarget(self, action: #selector(didTapBackgroundAlertButton), for: .touchUpInside)
        deliveredAlertButton.addTarget(self, action: #selector(didTapDeliveredAlertButton), for: .touchUpInside)
        pendingAlertButton.addTarget(self, action: #selector(didTapPendingAlertButton), for: .touchUpInside)
        deletePendingAlertButton.addTarget(self, action: #selector(didTapDeletePendingAlertButton), for: .touchUpInside)
        deleteDeleveredAlertButton.addTarget(self, action: #selector(didTapDeleteDeliveredAlertButton), for: .touchUpInside)
    }
    
    @objc private func didTapForegroundAlertButton(){
        AlertModel.shared.makeForegroundAlert()
    }
    
    @objc private func didTapBackgroundAlertButton(){
        AlertModel.shared.makeBackgroundAlert()
    }
    
    @objc private func didTapPendingAlertButton(){
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { (requests) in
            print("==========Pending Notification============")
            print(requests)
        }
    }
    
    @objc private func didTapDeliveredAlertButton(){
        let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications { (notifications) in
            print("==========Delivered Notification============")
            print(notifications)
        }
    }
    
    @objc private func didTapDeletePendingAlertButton(){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
//        //個別に指定
//        center.removePendingNotificationRequests(withIdentifiers: ["dinner"])
    }
    
    @objc private func didTapDeleteDeliveredAlertButton(){
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
//        //個別に指定
//        center.removeDeliveredNotifications(withIdentifiers: ["5seconds"])
    }
}
