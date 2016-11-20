//
//  SecondViewController.swift
//  AnimationSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private struct Const {
        static let ojisanInitialFrame = CGRect(x: 85, y: 115, width: 170, height: 170)
    }
    
    let ojisanImageView1 = UIImageView(image: UIImage(named: "ojisan"))
    let ojisanImageView2 = UIImageView(image: UIImage(named: "ojisan2"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: ojisanImageView1の追加
        
        // TODO: ojisanImageView2の追加
        
        // TODO: ojisanImageView2を非表示にしておく
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

