//
//  DailyView.swift
//  AbstractSample
//
//  Created by 鈴木 大貴 on 2016/11/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

protocol DailyViewDelegate: class {
    func dailyView(view: DailyView, didTapClose button: UIButton)
}

class DailyView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var delegate: DailyViewDelegate?
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        delegate?.dailyView(view: self, didTapClose: sender)
    }
}
