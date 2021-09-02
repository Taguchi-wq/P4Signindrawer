//
//  Minimize.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/29.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum Minimize {
    case arrowLeft
    case arrowRight
    
    
    var iconName: String {
        switch self {
        case .arrowLeft:
            return "arrow_left"
        case .arrowRight:
            return "arrow_right"
        }
    }
}
