//
//  MinimizeCell.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/29.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class MinimizeCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(minimize: Minimize) {
        iconImageView.image = UIImage(named: minimize.iconName)
    }
    
}
