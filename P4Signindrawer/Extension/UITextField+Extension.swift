//
//  UITextField+Extension.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addBottomBorder(color: UIColor = .gray) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
}
