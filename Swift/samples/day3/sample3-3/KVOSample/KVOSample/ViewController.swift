//
//  ViewController.swift
//  KVOSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class Counter: NSObject {
    static let shared = Counter()
    
    @objc dynamic var count: Int = 0
    
    private override init() {
        super.init()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    deinit {
        Counter.shared.removeObserver(self, forKeyPath: #keyPath(Counter.count))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countLabel.text = "\(Counter.shared.count)"
        
        Counter.shared.addObserver(self, forKeyPath: #keyPath(Counter.count), options: [.new, .old], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch (keyPath, change?[.newKey] as? Int) {
        case ((#keyPath(Counter.count))?, let newValue?):
            countLabel.text = "\(newValue)"
            
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func countDownButtonTapped(_ sender: UIButton) {
        Counter.shared.count = max(0, Counter.shared.count - 1)
    }
    
    @IBAction func countUpButtonTapped(_ sender: UIButton) {
        Counter.shared.count += 1
    }

    @IBAction func pushButtonTapped(_ sender: UIButton) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

