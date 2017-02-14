//
//  ViewController.swift
//  WebViewSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    
    // TODO: ボタン変数を追加

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        guard let url = URL(string: "https://abematimes.com/pages/381282/archives") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        // TODO: toolbarにボタンを追加
        
        // TODO: KVOでwebView.canGoBack, webView.canGoForwardを監視
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: toolbarのボタンが押された時の処理
    
}

extension ViewController: WKNavigationDelegate {
    // TODO: 読み込み完了のデリゲートメソッド追加、タイトルの変更など
}
