//
//  ViewController.swift
//  POPSample
//
//  Created by 鈴木 大貴 on 2016/11/10.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardObservable {
    
    @IBOutlet weak var textField: UITextField!
    
    var keyboardObservers: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func keyboardWillShow(_ notification: Notification) {
        //キーボードが表示される前の処理
        print(#function)
    }
    
    func keyboardDidShow(_ notification: Notification) {
        //キーボードが表示された後の処理
        print(#function)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        //キーボードが非表示にされる前の処理
        print(#function)
    }
    
    func keyboardDidHide(_ notification: Notification) {
        //キーボードが非表示にされた後の処理
        print(#function)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
}

