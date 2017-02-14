//
//  ViewController.swift
//  HTTPSample
//
//  Created by 鈴木 大貴 on 2016/10/28.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let username = textField.text else { return }
        fetchUser(username)
    }
    
    private func fetchUser(_ username: String) {
        guard
            let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://qiita.com/api/v2/users/\(encodedUsername)")
        else { return }
        //TODO: 通信を実行、完了白太textView.textに結果を代入して表示
    }
}

