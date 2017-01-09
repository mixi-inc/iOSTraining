import UIKit

class ParentObject {
    var object: AnyObject?
    
    deinit {
        print("ParentObject is released")
    }
}

class ChildObject {
    // TODO: objectを弱参照にして、main()の出力結果の違いを確かめてみましょう
    var object: AnyObject?
    
    deinit {
        print("ChildObject is released")
    }
}

func main() {
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
    print("parentObj is \(parentObj)")
    print("childObj is \(childObj)")
    print("childObj?.object is \(childObj?.object)")
    
    print("---- release childObj ----")
    childObj = nil
    print("childObj is \(childObj)")
}

main()
