//
//  ViewController.swift
//  KeyboardNotificationSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: 右ボタンを作成
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // TODO: キーボードが隠れる際の通知を登録
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - KeyboardNotification
    @objc func keyboardWillShow(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintをキーボードの高さに再設定する（userInfoのUIKeyboardFrameEndUserInfoKeyの値を参照する）
    }
    
    func keyboardWillHide(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintを0に再設定する
    }
    
    // TODO: キーボードを隠す処理
}

