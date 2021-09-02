//
//  Logo.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/30.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum Logo: CaseIterable {
    case logo
    case markLogo
    
    
    var imageName: String {
        switch self {
        case .logo:
            return "logo"
        case .markLogo:
            return "mark_logo"
        }
    }
    
    
}
