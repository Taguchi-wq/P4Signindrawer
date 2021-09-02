//
//  Menu.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/29.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum Menu: CaseIterable {
    case infomation
    case memo
    case train
    case logout
    
    
    var iconName: String {
        switch self {
        case .infomation:
            return "infomation"
        case .memo:
            return "memo"
        case .train:
            return "train"
        case .logout:
            return "logout"
        }
    }
    
    var name: String {
        switch self {
        case .infomation:
            return "Infomation"
        case .memo:
            return "Memo"
        case .train:
            return "Train"
        case .logout:
            return "Logout"
        }
    }
    
    var japanese: String {
        switch self {
        case .infomation:
            return "登録情報"
        case .memo:
            return "メモ"
        case .train:
            return "時刻表"
        case .logout:
            return "ログアウト"
        }
    }
    
    func detail(user: User) -> String {
        switch self {
        case .infomation:
            return "E-mail:\n\(user.email)\n\nName:\n\(user.name)\n\nPhone:\n\(user.phoneNumber)"
        case .memo:
            return "早くコロナが収束するといいな"
        case .train:
            return "ここに時刻を表示する"
        case .logout:
            return ""
        }
    }
    
}
