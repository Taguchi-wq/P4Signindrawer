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
    
    private var pageTitle = Menu.infomation.japanese
    private var detail    = Menu.infomation.detail
    
    
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var pageTitleLabel: UILabel!
    @IBOutlet private weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitleLabel.text = pageTitle
        detailLabel.text    = detail
        setupWebView(webView)
    }
    
    func initialize(menu: Menu) {
        pageTitle = menu.japanese
        detail    = menu.detail
    }
    
    private func setupWebView(_ webView: WKWebView) {
        let url = URL(string: "https://www.jec.ac.jp/?utm_source=g&utm_medium=kw&utm_campaign=lis&gclid=CjwKCAjw4KyJBhAbEiwAaAQbE3o8G4xF5-1Gjjz-WrVhQDlOP17Tlzyt39NtyvwtEuTKpXRjOikVbhoCXT4QAvD_BwE")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}
