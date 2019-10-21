//
//  GithubEntity.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol GithubEntity {
    init?(json: JSON)
}
