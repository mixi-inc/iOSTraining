//
//  ViewController.swift
//  DynamicHeightSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var sampleDataList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData()
        
        //TODO: - TableViewの設定
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CustomizedTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func loadData() {
        //TODO: - plistからデータをロードして、sampleDataListに追加
        guard
            let path = Bundle.main.path(forResource: "SampleData", ofType: "plist"),
            let rawArray =  NSArray(contentsOfFile: path),
            let array = rawArray as? [String]
        else { return }
        sampleDataList += array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomizedTableViewCell
        cell.mainTextLabel.font = .boldSystemFont(ofSize: 25)
        cell.mainTextLabel.text = sampleDataList[indexPath.row]
        cell.mainTextLabel.numberOfLines = 0
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    //TODO: - 計算した高さをTableViewのDelegateを使って返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let string = sampleDataList[indexPath.row]
        let attibutes = [ NSFontAttributeName : UIFont.boldSystemFont(ofSize: 25) ]
        let maxSize = CGSize(width: view.bounds.size.width - 68, height: .greatestFiniteMagnitude)
        let rect = (string as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attibutes, context: nil)
        return ceil(rect.size.height) + 40
    }
}
