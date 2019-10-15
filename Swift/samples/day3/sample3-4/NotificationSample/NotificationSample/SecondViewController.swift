//
//  SecondViewController.swift
//  NotificationSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self,
                                      selector: #selector(type(of: self).recieveNotification(_:)),
                                          name: NSNotification.Name(rawValue: "pushNotificationTapped"),
                                        object: nil)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "pushNotificationTapped"),
                                                object: nil, queue: OperationQueue.main) { notification in
            // do something
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func recieveNotification(_ notification: Notification) {
        // do something
        guard let value = notification.userInfo?["key"] as? String else { return }
        label.text = value
    }
}

