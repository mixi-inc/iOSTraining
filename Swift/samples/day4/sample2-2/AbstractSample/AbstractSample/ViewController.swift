//
//  ViewController.swift
//  AbstractSample
//
//  Created by 鈴木 大貴 on 2016/11/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dailyView: DailyView?
    
    var sharedObjects: [SharedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dailyChoiceView = DailyChoiceView.view()
        dailyChoiceView.delegate = self
        dailyChoiceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dailyChoiceView)
        view.addConstraints([
            NSLayoutConstraint(item: dailyChoiceView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dailyChoiceView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dailyChoiceView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dailyChoiceView.bounds.size.height),
            NSLayoutConstraint(item: dailyChoiceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dailyChoiceView.bounds.size.width)
        ])
        dailyView = dailyChoiceView
        
        sharedObjects = (0..<10).map { _ in
            SharedObject.shared
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: DailyViewDelegate {
    func dailyView(view: DailyView, didTapClose button: UIButton) {
        dailyView?.removeFromSuperview()
    }
}

extension ViewController: DailyChoiceViewDelegate {
    func dailyView(view: DailyView, didTapNo button: UIButton) {
        print("no tapped")
    }
    
    func dailyView(view: DailyView, didTapYes button: UIButton) {
        print("yes tapped")
    }
}

class SharedObject {
    
    static let shared = SharedObject()
    
    private init() {}
    
    func doSomething() {
        //doSomething
    }
}
