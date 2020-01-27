//
//  ShowAllert.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/23/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit

func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    
    if let nav = base as? UINavigationController {
        return topViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
        let moreNavigationController = tab.moreNavigationController
        
        if let top = moreNavigationController.topViewController , top.view.window != nil {
            return topViewController(base: top)
        } else if let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
    }
    if let presented = base?.presentedViewController {
        return topViewController(base: presented)
    }
    return base
}

struct ShowAllert {
    static func showWith(title:String? = nil, message:String? = nil){
        if let _ = topViewController() as? UIAlertController {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        topViewController()?.present(alert, animated: true, completion: nil)
    }
}


