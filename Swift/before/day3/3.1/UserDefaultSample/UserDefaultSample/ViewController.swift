//
//  ViewController.swift
//  UserDefaultSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let array: [String] = (0..<10).map { "\($0)" }
        UserDefaults.standard.set(array, forKey: "array")
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        guard let array = UserDefaults.standard.object(forKey: "array") as? [String] else { return }
        print(array)
    }
    
    @IBAction func readSettingButtonTapped(_ sender: UIButton) {
        // TODO: Setting Bundleで設定したtextFieldの値を取得
    }
}

