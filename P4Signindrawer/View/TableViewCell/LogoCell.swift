//
//  LogoCell.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/29.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class LogoCell: UITableViewCell {

    @IBOutlet private weak var logoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(logo: Logo) {
        logoImageView.image = UIImage(named: logo.imageName)
    }
    
}
