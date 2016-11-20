//
//  ViewController.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var repositories: [GithubRepository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(GithubTableViewCell.nib, forCellReuseIdentifier: GithubTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        if !UIApplication.shared.isStatusBarHidden {
            tableView.contentInset.top = UIApplication.shared.statusBarFrame.size.height
        }
        
        fetchRepositories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchRepositories() {
        
        //TODO: - 取得中はactivityIndicatorをアニメーションさせる
        
        //TODO: - 該当のURLからJSONを取得する
                    
        //TODO: - 取得したJSONらGithubRepositoryの配列を生成し、repositoriesに代入

        //TODO: - 取得に失敗した場合は、エラーのアラートを出す
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTableViewCell.identifier) as! GithubTableViewCell
        //TODO: - セルに表示する内容を設定する
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: - セルの高さを計算する
        return 0
    }
}
