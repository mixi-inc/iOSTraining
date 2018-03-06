//
//  ViewController.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var repositories: [GithubRepository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(GithubTableViewCell.nib, forCellReuseIdentifier: GithubTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        if !UIApplication.shared.isStatusBarHidden {
            tableView.contentInset.top = UIApplication.shared.statusBarFrame.size.height
        }
        
        fetchRepositories()
    }

    private func fetchRepositories() {
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.startAnimating()
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language%3Aswift&sort=stars")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                UIAlertController.showRetryAlert(to: self, with: error) { [weak self] in
                    self?.fetchRepositories()
                }
            } else {
                if let data = data {
                    do {
                        let object = try JSONSerialization.jsonObject(with: data, options: [])
                        let json = JSON(object)
                        let items = json["items"]
                        DispatchQueue.main.async {
                            for (index, item) in items.enumerated() {
                                guard let repository = GithubRepository(json: JSON(items[index])) else {
                                    continue
                                }
                                self.repositories.append(repository)
                            }
                            self.tableView.reloadData()
                        }
                    } catch let e {
                        print(e)
                    }
                }
            }
            
            // finally
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTableViewCell.identifier) as! GithubTableViewCell
        cell.configure(with: repositories[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let repository = repositories[indexPath.row]
        let maxSize = tableView.bounds.size
        return GithubTableViewCell.height(of: repository, with: maxSize)
    }
}
