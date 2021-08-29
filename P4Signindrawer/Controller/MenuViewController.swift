//
//  MenuViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/28.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return tableView.bounds.height - (80 * 6)
        } else {
            return 80
        }
    }
    
}
