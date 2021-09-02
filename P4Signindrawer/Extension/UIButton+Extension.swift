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
    
    func addBorder(width: CGFloat = 3, color: UIColor = Color.jec) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
}
