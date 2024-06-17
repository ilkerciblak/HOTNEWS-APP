//
//  WebViewable.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 16.06.2024.
//

import Foundation
import WebKit


protocol WebViewable where Self: UIViewController{
    func pushWebView(url:String)
}

extension WebViewable{
    func pushWebView(url:String){
        
        guard let url = URL(string: url) else{
            return
        }
        let vc = WebViewController()
        vc.configure(url: url)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
