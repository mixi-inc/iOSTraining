//
//  ViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO: SecondViewControllerのdelegateを準拠する
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTapped(_ sender: UIButton) {
        let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
        // TODO: secondViewControllerのdelegateを自分にセット
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
    }

    // TODO: SecondViewController の delegateメソッドを実装
}

