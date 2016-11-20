//: Playground - noun: a place where people can play

import UIKit

class ParentObject {
    var object: AnyObject?
}

class ChildObject {
    var object: AnyObject?
}

func main() {
    //ParentObjectのインスタンスへの強参照をparentObjが所持
    let parentObj: ParentObject = ParentObject()

    //ChildObjectのインスタンスへの強参照をchildObjが所持
    let childObj: ChildObject = ChildObject()

    //TODO: 追加
}

main()