//
//  SearchRequest.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SearchRequest: GithubRequestable {
    
    enum Language: String {
        case swift = "swift"
    }
    
    enum Sort: String {
        case stars = "stars"
    }
    
    typealias DecodedResultType = [GithubRepository]
    
    var path: String {
        return "/search/repositories"
    }
    
    var parameters: [String : Any]? {
        var params: [String : Any] = ["sort" : sort.rawValue]
        if let q = "language:\(language.rawValue)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            params["q"] = q
        }
        return params
    }
    
    let language: Language
    let sort: Sort
    
    init(language: Language = .swift, sort: Sort = .stars) {
        self.language = language
        self.sort = sort
    }
    
    static func decode(_ data: Data) -> DecodedResultType? {
        do {
            let json = try JSON(data: data)
            guard let items = json["items"].array else {
                return nil
            }
            return items.compactMap{ GithubRepository(json: $0) }
        } catch {
            return nil
        }
    }
}
