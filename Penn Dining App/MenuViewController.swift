//
//  MenuViewController.swift
//  Penn Dining App
//
//  Created by Marta García Ferreiro on 9/22/18.
//  Copyright © 2018 Marta García Ferreiro. All rights reserved.
//  code for webview: https://www.ioscreator.com/tutorials/webview-ios-tutorial-ios11
//

import UIKit
import WebKit

class MenuViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    // menu url is sent through the segue
    var menuURL = String()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: menuURL)!
        webView.load(URLRequest(url: url))
        navigationController?.isToolbarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //displays title of webpage when it is loaded
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}
