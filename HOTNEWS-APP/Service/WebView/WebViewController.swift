//
//  WebViewController.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 16.06.2024.
//

import Foundation
import WebKit
import UIKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
    public var url : URL? = nil
    private var webView: WKWebView = {
        
        
        let view = WKWebView()
        view.allowsBackForwardNavigationGestures = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view.addSubview(webView)
        loadWebView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.frame
    }
    
    public func configure(url: URL){
        self.url = url
    }
    
    private func loadWebView(){
        let request = URLRequest(url: self.url!)
        webView.load(request)
    }
    
    
    
    
    
}
