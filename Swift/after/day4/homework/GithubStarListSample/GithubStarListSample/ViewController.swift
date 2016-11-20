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
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //TODO: - 該当のURLからJSONを取得する
        let request = SearchRequest(language: .swift, sort: .stars)
        APIClient.sendRequest(request) { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch result {
                case .success(let repositories):
                    
                    //TODO: - 取得したJSONらGithubRepositoryの配列を生成し、repositoriesに代入
                    self?.repositories = repositories
                    self?.tableView.reloadData()
                    
                case .failure(let error):
                    
                    //TODO: - 取得に失敗した場合は、エラーのアラートを出す
                    UIAlertController.showRetryAlert(to: self, with: error) { [weak self] in
                        self?.fetchRepositories()
                    }
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTableViewCell.identifier) as! GithubTableViewCell
        //TODO: - セルに表示する内容を設定する
        cell.configure(with: repositories[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let repository = repositories[indexPath.row]
        let maxSize = tableView.bounds.size
        //TODO: - セルの高さを計算する
        return GithubTableViewCell.height(of: repository, with: maxSize)
    }
}
