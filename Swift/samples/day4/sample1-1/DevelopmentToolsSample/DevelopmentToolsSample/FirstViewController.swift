//
//  FirstViewController.swift
//  DevelopmentToolsSample
//
//  Created by 鈴木大貴 on 2016/11/03.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let array = (0..<10).map { value -> String in
            let str = string(from: value)
            return str
        }
        print(array)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func string(from value: Int) -> String {
        return "\(value)"
    }
}
