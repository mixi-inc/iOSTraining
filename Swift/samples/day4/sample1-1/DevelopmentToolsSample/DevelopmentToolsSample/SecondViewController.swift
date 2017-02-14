//
//  SecondViewController.swift
//  DevelopmentToolsSample
//
//  Created by 鈴木大貴 on 2016/11/03.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale.system
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        cell.textLabel?.text = formatter.string(from: Date())
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj1 = LeakObject()
        let obj2 = LeakObject()
        
        obj1.obj = obj2
        obj2.obj = obj1
    }
}

class LeakObject {
    var obj: LeakObject?
}
