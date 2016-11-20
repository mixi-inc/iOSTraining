//
//  DailyChoiceView.swift
//  AbstractSample
//
//  Created by 鈴木 大貴 on 2016/11/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

protocol DailyChoiceViewDelegate: DailyViewDelegate {
    func dailyView(view: DailyView, didTapYes button: UIButton)
    func dailyView(view: DailyView, didTapNo button: UIButton)
}

class DailyChoiceView: DailyView {

    class func view() -> DailyChoiceView {
        return Bundle.main.loadNibNamed("DailyChoiceView", owner: nil, options: nil)?.last as! DailyChoiceView
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        (delegate as? DailyChoiceViewDelegate)?.dailyView(view: self, didTapYes: sender)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        (delegate as? DailyChoiceViewDelegate)?.dailyView(view: self, didTapNo: sender)
    }
}
