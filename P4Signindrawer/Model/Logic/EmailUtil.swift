//
//  EmailUtil.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/09/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

class EmailUtil {
    
    func parse(_ email: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let isEmail = NSPredicate(format:"SELF MATCHES %@", emailRegex).evaluate(with: email)
        return isEmail ? email : nil
    }
    
}
