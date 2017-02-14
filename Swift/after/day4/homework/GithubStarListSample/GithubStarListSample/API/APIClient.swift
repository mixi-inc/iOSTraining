//
//  APIClient.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
        
    private init() {}
    
    //TODO: - 通信のリクエストをして、closureで結果を返す
    class func sendRequest<T: GithubRequestable>(_ request: T, completion: @escaping (Result<T.DecodedResultType>) -> ()) {
        guard let url = request.createURL() else {
            fatalError("can not create URL with \(request)")
        }
        Alamofire.request(url, parameters: request.parameters).responseData { response in
            switch response.result {
            case .success(let data):
                guard let decodedResult = T.decode(data) else {
                    completion(.failure(NSError(domain: "Decode Error", code: -9999, userInfo: nil)))
                    return
                }
                completion(.success(decodedResult))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
