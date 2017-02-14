//
//  NextViewController.swift
//  NavigationSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var buttonString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let buttonString = buttonString else { return }
        label.text = "Button \(buttonString) Tapped"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
