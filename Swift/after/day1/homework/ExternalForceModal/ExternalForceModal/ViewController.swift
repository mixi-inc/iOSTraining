//
//  ViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO: SecondViewControllerのdelegateを準拠する
class ViewController: UIViewController {

    // viewDidAppearが呼ばれたかどうかのproperty
    private var isFirstViewDidAppear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 初回はif文に入って処理が終わる
        if isFirstViewDidAppear {
            isFirstViewDidAppear = false
            return
        }
        // 2回目以降はSecondViewControllerが表示される
        showSecondViewController()
    }

    @IBAction func showTapped(_ sender: UIButton) {
        showSecondViewController()
    }
    
    private func showSecondViewController() {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        // TODO: secondViewControllerのdelegateを自分にセット
        secondViewController.delegate = self
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
        present(secondViewController, animated: true, completion: nil)
    }
}

extension ViewController: SecondViewControllerDelegate {
    // TODO: SecondViewController の delegateメソッドを実装
    func secondViewController(_ viewController: SecondViewController, didTapClose button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
