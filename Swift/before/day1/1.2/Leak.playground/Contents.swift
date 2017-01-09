import UIKit

class ParentObject {
    var object: AnyObject?
    
    deinit {
        print("ParentObject: released")
    }
}

class ChildObject {
    // TODO: 2.objectを弱参照にして、main()の出力結果の違いを確かめてみましょう
    var object: AnyObject?
    
    deinit {
        print("ChildObject: released")
    }
}

func main() {
    //ParentObjectのインスタンスへの強参照をparentObjが所持
    var parentObj: ParentObject? = ParentObject()
    
    //ChildObjectのインスタンスへの強参照をchildObjが所持
    var childObj: ChildObject? = ChildObject()
    
    // TODO: 1.上記2つのオブジェクトのプロパティobjectにお互いを代入して、
    // printの結果がどう変わるか確認しましょう
    
    // 何もしなければ2つの変数は解放されます(deinitのprintが実行される)
}

main()
