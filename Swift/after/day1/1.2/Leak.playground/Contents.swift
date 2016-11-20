//: Playground - noun: a place where people can play

import UIKit

class ParentObject {
    var object: AnyObject?
    
    deinit {
        print(type(of: self))
    }
}

class ChildObject {
    //弱参照にすることで、循環参照を防げる
    weak var object: AnyObject?
    
    deinit {
        print(type(of: self))
    }
}

func main() {
    //ParentObjectのインスタンスへの強参照をparentObjが所持
    let parentObj: ParentObject = ParentObject()

    //ChildObjectのインスタンスへの強参照をchildObjが所持
    let childObj: ChildObject = ChildObject()

    //parentObjのインスタンス変数がchildObjへの強参照を保持
    parentObj.object = childObj
    //childObjのインスタンス変数がparentObjへの強参照を保持
    childObj.object = parentObj
        
    //parentObjがnilになるので、parentObjがParentObjectのインスタンスへの参照を解除（解放）
    //childObjがnilになるので、、childObjがChildObjectのインスタンスを解放
    
    //parentObj.objectがChildObjectのインスタンスの強参照を保持
    //childObj.objectがParentObjectのインスタンスの強参照を保持
}

main()
