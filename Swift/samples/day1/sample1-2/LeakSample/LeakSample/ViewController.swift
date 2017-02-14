//
//  ViewController.swift
//  LeakSample
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ParentObjectのインスタンスへの強参照をparentObjが所持
        let parentObject = ParentObject()
        
        //ChildObjectのインスタンスへの強参照をchildObjが所持
        let childObject = ChildObject()
        
        //parentObjのインスタンス変数がchildObjへの強参照を保持
        parentObject.object = childObject
        //childObjのインスタンス変数がparentObjへの強参照を保持
        childObject.object = parentObject
        
        //parentObjがnilになるので、parentObjがParentObjectのインスタンスへの参照を解除（解放）
        //childObjがnilになるので、、childObjがChildObjectのインスタンスを解放
        
        //parentObj.objectがChildObjectのインスタンスの強参照を保持
        //childObj.objectがParentObjectのインスタンスの強参照を保持
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class ParentObject {
    var object: AnyObject?
}

class ChildObject {
    var object: AnyObject?
}
