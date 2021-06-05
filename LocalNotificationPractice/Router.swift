//
//  Router.swift
//  LocalNotificationPractice
//
//  Created by 肥沼英里 on 2021/06/05.
//

import Foundation
import UIKit

final class Router{
    static let shared = Router()
    private init() {}
    
    private var window: UIWindow?
    
    func showRoot(window: UIWindow){
        
        guard let vc = UIStoryboard.init(name: "AlertView", bundle: nil).instantiateInitialViewController() as? AlertViewController
        else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
    }
}
