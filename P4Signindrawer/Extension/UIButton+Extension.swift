//
//  UIButton+Extension.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

extension UIButton {
    
    func roundCorners(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
    }
    
    func addBorder(color: UIColor = Color.jec) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 3
    }
    
}
