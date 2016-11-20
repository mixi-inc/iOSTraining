//
//  SecondViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO:
// delegateのためのプロトコルを定義
protocol SecondViewControllerDelegate: class {
    
// ここにDelegateメソッドの定義
    
}

class SecondViewController: UIViewController {

    // TODO: delegate変数の用意
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        // TODO:
        // ボタンがタップされた時に呼ばれるメソッド
        // delegateを介してモーダルを消す
    }
}
