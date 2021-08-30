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

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.jec.ac.jp/?utm_source=g&utm_medium=kw&utm_campaign=lis&gclid=CjwKCAjw4KyJBhAbEiwAaAQbE3o8G4xF5-1Gjjz-WrVhQDlOP17Tlzyt39NtyvwtEuTKpXRjOikVbhoCXT4QAvD_BwE")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}
