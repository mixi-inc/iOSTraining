//
//  ViewController.swift
//  InfiniteNavigationSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let string: String
        if let count = navigationController?.viewControllers.count {
            string = "\(count)"
        } else {
            string = ""
        }
        title = string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButtonTapped(_ sender: UIButton) {
        guard let viewControlelr = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        navigationController?.pushViewController(viewControlelr, animated: true)
    }
}

