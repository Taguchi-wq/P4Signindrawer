//
//  PasswordUtil.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/09/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

class PasswordUtil {
    
    func parse(_ password: String) -> String? {
        let passwordRegex = "^(?=.*?[A-Za-z])(?=.*?[0-9])[A-Za-z0-9]{6,}$"
        let isPassword = NSPredicate(format:"SELF MATCHES %@", passwordRegex).evaluate(with: password)
        return isPassword ? password : nil
    }
    
}
