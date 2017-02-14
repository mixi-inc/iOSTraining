//
//  ViewController.swift
//  ViewControllerBasic
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // TODO: プロパティの追加
    let sampleVC: SampleViewController = SampleViewController(nibName: "SampleViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: MixiSampleViewControllerの追加
        view.addSubview(sampleVC.view)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sampleVC.view.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
