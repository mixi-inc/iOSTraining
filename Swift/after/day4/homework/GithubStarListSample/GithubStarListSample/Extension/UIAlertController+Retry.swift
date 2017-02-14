//
//  UIAlertController+Retry.swift
//  GithubStarListSample
//
//  Created by marty-suzuki on 2016/12/04.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func showRetryAlert(to viewController: UIViewController?, with error: Error, retryhandler: @escaping () -> ()) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            retryhandler()
        })
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
