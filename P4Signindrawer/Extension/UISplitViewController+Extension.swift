//
//  UISplitViewController+Extension.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

extension UISplitViewController {
    
    func animateMasterWidth(_ width: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.maximumPrimaryColumnWidth = width
        }
    }
    
}
