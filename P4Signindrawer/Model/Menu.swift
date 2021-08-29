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
    
}
