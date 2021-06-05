//
//  UIAlertControllerExtension.swift
//  GarbageApps
//
//  Created by 肥沼英里 on 2021/06/02.
//

import Foundation
import UIKit

extension UIAlertController{
    
    static func showAlert(message: String, _ viewController: UIViewController){
        let message = message
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
