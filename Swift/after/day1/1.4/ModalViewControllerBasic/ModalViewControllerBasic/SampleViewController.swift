//
//  SampleViewController.swift
//  ModalViewControllerBasic
//
//  Created by 鈴木大貴 on 2016/10/16.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        let viewControlelr = ChildViewController(nibName: "ChildViewController", bundle: nil)
        viewControlelr.delegate = self // [5] delegate 先として自身を代入
        present(viewControlelr, animated: true, completion: nil)
    }
}

extension SampleViewController: ChildViewControllerDelegate { // [4] protocol の採用
    func childViewController(_ viewController: ChildViewController, didPressCloseButton button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
