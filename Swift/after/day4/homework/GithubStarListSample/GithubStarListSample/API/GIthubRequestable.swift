//
//  GIthubRequestable.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation

protocol GithubRequestable {
    associatedtype DecodedResultType
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String : Any]? { get }
    func createURL() -> URL?
    static func decode(_ data: Data) -> DecodedResultType?
}

extension GithubRequestable {
    var baseURL: String {
        return "https://api.github.com"
    }
    
    func createURL() -> URL? {
        return URL(string: baseURL + path)
    }
}
