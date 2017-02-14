//
//  ViewController.swift
//  CarthageSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

import Reachability

import Alamofire

import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let reachability = Reachability()!
        let status = reachability.currentReachabilityStatus
        
        switch status {
        case .notReachable:
            print("not reachable")
        case .reachableViaWiFi:
            print("wifi")
        case .reachableViaWWAN:
            print("wwan")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        Alamofire.request("https://qiita.com/api/v2/users/marty-suzuki").response() { response in
            switch response.data {
            case .some(let data):
                let json = JSON(data: data)
                if let name = json["name"].string {
                    print(name)
                }
            default:
                break
            }
        }
    }
}

