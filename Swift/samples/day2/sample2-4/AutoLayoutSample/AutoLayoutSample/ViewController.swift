//
//  ViewController.swift
//  AutoLayoutSample
//
//  Created by 鈴木大貴 on 2016/10/25.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var brownView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        brownView.addSubview(greenView)
        brownView.addConstraints([
            NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: brownView, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: greenView, attribute: .left, relatedBy: .equal, toItem: brownView, attribute: .left, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: greenView, attribute: .right, relatedBy: .equal, toItem: brownView, attribute: .right, multiplier: 1, constant: -50),
            NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: brownView, attribute: .bottom, multiplier: 1, constant: -50)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

