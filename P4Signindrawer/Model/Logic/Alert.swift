//
//  Alert.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/09/02.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

public enum Alert {
    
    private static func createBasicAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        return alert
    }
    
    static func presentError(on viewController: UIViewController, message: InputError) {
        let alert = createBasicAlert(title: "エラー", message: message.rawValue, handler: nil)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
    static func presentSignUp(on viewController: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let alert = createBasicAlert(title: "サインアップに成功しました。", message: "", handler: handler)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
    static func presentLogOut(on viewController: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let alert = createBasicAlert(title: "ログアウトしますか？", message: "", handler: handler)
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel))
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
}
