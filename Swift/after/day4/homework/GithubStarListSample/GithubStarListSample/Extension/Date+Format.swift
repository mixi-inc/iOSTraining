//
//  Date+Format.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation

extension Date {
    private struct Const {
        static let ISO8601Formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
            return dateFormatter
        }()
        
        static let YYYYMMddFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY/MM/dd"
            return formatter
        }()
    }
    
    init?(fromISO8601 string: String) {
        guard let date = Const.ISO8601Formatter.date(from: string) else {
            return nil
        }
        self = date
    }
    
    func YYYYMMddString() -> String {
        return Const.YYYYMMddFormatter.string(from: self)
    }
}
