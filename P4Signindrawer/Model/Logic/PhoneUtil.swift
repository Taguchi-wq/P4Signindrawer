//
//  PhoneUtil.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/09/01.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

class PhoneUtil {
    
    func parse(_ phoneNumberString: String) -> Int? {
        // 電話番号の桁数
        let phoneNumberDigits = 11
        // 電話番号の文字列が11桁かどうか
        if phoneNumberString.count != phoneNumberDigits {
            return nil
        }
        
        // 電話番号の文字列が数字にできるかどうか
        guard let phoneNumber = Int(phoneNumberString) ?? nil else {
            return nil
        }
        
        return phoneNumber
    }
    
}
