//
//  MenuViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/28.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    private var isOpen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(tableView)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSectionKind.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let menuSectionKind = MenuSectionKind.allCases[section]
        switch menuSectionKind {
        case .logo:
            return 1
        case .menu:
            return 3
        case .logout:
            return 1
        case .minimize:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuSectionKind = MenuSectionKind.allCases[indexPath.section]
        switch menuSectionKind {
        case .logo:
            let logoCell = tableView.dequeueReusableCell(withIdentifier: LogoCell.reuseIdentifier) as! LogoCell
            logoCell.selectionStyle = .none
            
            if isOpen {
                logoCell.initialize(logo: Logo.logo)
            } else {
                logoCell.initialize(logo: Logo.markLogo)
            }
            
            return logoCell
        case .menu:
            let menuCell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
            menuCell.initialize(menu: Menu.allCases[indexPath.row])
            return menuCell
        case .logout:
            let menuCell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
            // Logoutだけ渡す
            menuCell.initialize(menu: Menu.allCases[3])
            return menuCell
        case .minimize:
            let minimizeCell = tableView.dequeueReusableCell(withIdentifier: MinimizeCell.reuseIdentifier) as! MinimizeCell
            
            if isOpen {
                minimizeCell.initialize(minimize: Minimize.arrowLeft)
            } else {
                minimizeCell.initialize(minimize: Minimize.arrowRight)
            }
            
            return minimizeCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let menuSectionKind = MenuSectionKind.allCases[section]
        switch menuSectionKind {
        case .logout:
            let width = tableView.bounds.width
            let height = tableView.bounds.height - (80 * 6 + 20)
            let header = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            return header
        default:
            return UIView()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let menuSectionKind = MenuSectionKind.allCases[section]
        switch menuSectionKind {
        case .logout:
            return view.bounds.height - (80 * 6 + 20)
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuSectionKind = MenuSectionKind.allCases[indexPath.section]
        switch menuSectionKind {
        case .logo:
            return
        case .menu:
            changeDetailView(menu: Menu.allCases[indexPath.row])
        case .logout:
            logout()
        case .minimize:
            minimizeMenu()
        }
    }
    
}

extension MenuViewController {
    
    private enum MenuSectionKind: CaseIterable {
        case logo
        case menu
        case logout
        case minimize
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.register(UINib(nibName: LogoCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: LogoCell.reuseIdentifier)
        tableView.register(UINib(nibName: MenuCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: MenuCell.reuseIdentifier)
        tableView.register(UINib(nibName: MinimizeCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: MinimizeCell.reuseIdentifier)
    }
    
    private func minimizeMenu() {
        guard let splitViewController = splitViewController else { return }
        if isOpen {
            isOpen = false
            splitViewController.animateMasterWidth(90)
        } else {
            isOpen = true
            splitViewController.animateMasterWidth(300)
        }
        
        tableView.reloadData()
    }
    
    private func changeDetailView(menu: Menu) {
        guard let splitViewController = splitViewController else { return }
        guard let infomationVC = storyboard?.instantiateViewController(withIdentifier: InfomationViewController.reuseIdentifier) as? InfomationViewController else { return }
        infomationVC.initialize(menu: menu)
        splitViewController.showDetailViewController(infomationVC, sender: nil)
    }
    
    private func logout() {
        Alert.presentLogOut(on: self) { _ in
            self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        }
    }
    
}
