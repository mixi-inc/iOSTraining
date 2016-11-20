//
//  ViewController.swift
//  CocoaPodsSample
//
//  Created by 鈴木大貴 on 2016/11/04.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

import Reachability

import Alamofire

import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let reachability = Reachability.forInternetConnection()!
        let status = reachability.currentReachabilityStatus()
        
        switch status {
        case .NotReachable:
            print("not reachable")
        case .ReachableViaWiFi:
            print("wifi")
        case .ReachableViaWWAN:
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

