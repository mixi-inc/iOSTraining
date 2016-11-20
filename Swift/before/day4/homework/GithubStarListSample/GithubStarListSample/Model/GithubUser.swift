//
//  GithubUser.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GithubUser: GithubEntity {
    let avatarUrl: URL
    let login: String
    
    init?(json: JSON) {
        guard
            let rawAvatorUrl = json["avatar_url"].string,
            let avatarUrl = URL(string: rawAvatorUrl),
            let login = json["login"].string
        else { return nil }
        
        self.avatarUrl = avatarUrl
        self.login = login
    }
}
