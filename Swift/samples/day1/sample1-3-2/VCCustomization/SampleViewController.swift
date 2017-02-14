//
//  SampleViewController.swift
//  VCCustomization
//
//  Created by 鈴木大貴 on 2016/10/15.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        grayView.backgroundColor = .red
    }
}
