//
//  ViewController.swift
//  NavigationSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let buttonString: String
        switch sender {
        case buttonA:
            buttonString = "A"
        case buttonB:
            buttonString = "B"
        case buttonC:
            buttonString = "C"
        default:
            return
        }
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else {
            return
        }
        viewController.buttonString = buttonString
        navigationController?.pushViewController(viewController, animated: true)
    }
}

