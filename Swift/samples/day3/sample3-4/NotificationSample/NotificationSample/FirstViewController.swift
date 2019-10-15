//
//  FirstViewController.swift
//  NotificationSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushNotificationTapped(_ sender: UIButton) {
        let dict = ["key" : "hoge"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushNotificationTapped"), object: self, userInfo: dict)
    }
}

