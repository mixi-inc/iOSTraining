import UIKit

class ParentObject {
    var object: AnyObject?
    
    deinit {
        print("ParentObject: released")
    }
}

class ChildObject {
    //弱参照にすることで、循環参照を防げる
    weak var object: AnyObject?
    
    deinit {
        print("ChildObject: released")
    }
}

//ParentObjectのインスタンスへの強参照をparentObjが所持
var parentObj: ParentObject? = ParentObject()

//ChildObjectのインスタンスへの強参照をchildObjが所持
var childObj: ChildObject? = ChildObject()

//parentObjのインスタンス変数がchildObjへの強参照を保持
parentObj?.object = childObj
//childObjのインスタンス変数がparentObjへの強参照を保持
childObj?.object = parentObj

//parentObjがnilになるので、parentObjがParentObjectのインスタンスへの参照を解除（解放）
//childObjがnilになるので、、childObjがChildObjectのインスタンスを解放
print("---- release parentObj ----")
parentObj = nil

print("---- release childObj ----")
childObj = nil
