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
    lazy var backButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(ViewController.backButtonTapped(_:)))
    }()
    lazy var forwardButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(ViewController.forwardButtonTapped(_:)))
    }()
    lazy var relaodButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Relaod", style: .plain, target: self, action: #selector(ViewController.reloadButtonTapped(_:)))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        guard let url = URL(string: "https://github.com/apple") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        // TODO: toolbarにボタンを追加
        navigationController?.isToolbarHidden = false
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        toolbarItems = [backButton, forwardButton, relaodButton]
        
        // TODO: KVOでwebView.canGoBack, webView.canGoForwardを監視
        [
            #keyPath(WKWebView.canGoBack),
            #keyPath(WKWebView.canGoForward),
            #keyPath(WKWebView.title)
        ].forEach { keyPath in
            webView.addObserver(self, forKeyPath: keyPath, options: [.new, .old], context: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch (keyPath, change?[.newKey], change?[.oldKey]) {
        case ((#keyPath(WKWebView.canGoBack))?, let newVal as Bool, let oldVal as Bool) where newVal != oldVal:
            backButton.isEnabled =  newVal
            
        case ((#keyPath(WKWebView.canGoForward))?, let newVal as Bool, let oldVal as Bool) where newVal != oldVal:
            forwardButton.isEnabled =  newVal
            
        case ((#keyPath(WKWebView.title))?, let newVal as String, let oldVal as String) where newVal != oldVal:
            title = newVal
            
        default:
            break
        }
    }
    
    // TODO: toolbarのボタンが押された時の処理
    func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    func forwardButtonTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    func reloadButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(navigationAction.request.url)
        decisionHandler(.allow)
    }
    
    // TODO: 読み込み完了のデリゲートメソッド追加、タイトルの変更など
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
    }
}
