//
//  InfomationViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/30.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit
import WebKit

class InfomationViewController: UIViewController {
    
    private var pageTitle: String?
    private var detail: String?
    
    
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var pageTitleLabel: UILabel!
    @IBOutlet private weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView(webView)
        pageTitleLabel.text = pageTitle ?? Menu.infomation.japanese
        guard let user = getUser() else { return }
        detailLabel.text = detail ?? Menu.infomation.detail(user: user)
    }
    
    func initialize(menu: Menu) {
        pageTitle = menu.japanese
        guard let user = getUser() else { return }
        detail = menu.detail(user: user)
    }
    
    private func setupWebView(_ webView: WKWebView) {
        let url = URL(string: "https://www.jec.ac.jp/?utm_source=g&utm_medium=kw&utm_campaign=lis&gclid=CjwKCAjw4KyJBhAbEiwAaAQbE3o8G4xF5-1Gjjz-WrVhQDlOP17Tlzyt39NtyvwtEuTKpXRjOikVbhoCXT4QAvD_BwE")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    private func getUser() -> User? {
        let userID = UserDefaults.standard.string(forKey: "userID") ?? ""
        let user = RealmManager.shared.loadUserByPrimaryKey(userID)
        return user
    }
    
}
