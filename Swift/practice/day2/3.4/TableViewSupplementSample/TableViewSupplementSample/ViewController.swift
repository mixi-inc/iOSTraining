//
//  ViewController.swift
//  TableViewSupplementSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 行数を返す
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "(\(indexPath.section), \(indexPath.row))"
        // セルを返す
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // セクション数を返す
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // セクションタイトルを返す
        return "\(section) 番目のセクション"
    }
}

extension ViewController: UITableViewDelegate {
    // TODO: ヘッダの高さを返す
    
    // TODO: ヘッダの内容を返す
    
    // TODO: フッタの高さを返す
    
    // TODO: フッタの内容を返す
}
