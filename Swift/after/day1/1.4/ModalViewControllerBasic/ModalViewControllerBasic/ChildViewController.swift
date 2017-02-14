//
//  ChildViewController.swift
//  ModalViewControllerBasic
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

protocol ChildViewControllerDelegate: class { // [1] プロトコルの宣言
    func childViewController(_ viewController: ChildViewController, didPressCloseButton button: UIButton)
}

class ChildViewController: UIViewController {

    weak var delegate: ChildViewControllerDelegate? // [2] delegate オブジェクト
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pressClosedButton(_ sender: UIButton) {
        delegate?.childViewController(self, didPressCloseButton: sender)
    }
}
