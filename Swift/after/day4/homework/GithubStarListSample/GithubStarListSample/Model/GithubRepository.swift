//
//  GithubRepository.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GithubRepository: GithubEntity {
    
    let name: String
    let owner: GithubUser
    let `description`: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let createdAt: Date
    let updatedAt: Date
    
    init?(json: JSON) {
        guard
            let name = json["name"].string,
            let owner = GithubUser(json: json["owner"]),
            let description = json["description"].string,
            let stargazersCount = json["stargazers_count"].int,
            let watchersCount = json["watchers_count"].int,
            let forksCount = json["forks_count"].int,
            let rawCreatedAt = json["created_at"].string,
            let createdAt = Date(fromISO8601: rawCreatedAt),
            let rawUpdatedAt = json["updated_at"].string,
            let updatedAt = Date(fromISO8601: rawUpdatedAt)
        else { return nil }
        
        self.name = name
        self.owner = owner
        self.description = description
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.forksCount = forksCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
