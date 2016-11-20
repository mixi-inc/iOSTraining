> 参考 [mixi-inc/iOSTraining
 1.2 メモリ管理](https://github.com/mixi-inc/iOSTraining/wiki/1.2-%E3%83%A1%E3%83%A2%E3%83%AA%E7%AE%A1%E7%90%86)

メモリ管理の考え方と ARC
[MemoryMgmt](https://developer.apple.com/jp/devcenter/ios/library/documentation/MemoryMgmt.pdf)
# 参照カウント
> ![reference count](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/MemoryMgmt/Art/memory_management_2x.png)

[Advanced Memory Management Programming Guide](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html) から引用

Objective-C ではインスタンスへの参照回数が 1 以上であればメモリ領域が確保され続けインスタンスは生存し続けます。

# ARC
ARC では上記の retain, release はコンパイラが自動で補完してくれます。よって、書くとエラーが出てビルド出来ません。

> ![ARC](https://developer.apple.com/library/mac/releasenotes/MacOSX/WhatsNewInOSX/Art/ARC_design_final.gif)

> [Programming With ARC Release Notes](http://developer.apple.com/library/mac/#releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_7.html) から引用

# オーナーシップ
参照には **強参照** と **弱参照** があります。

## 強参照

参照先のオブジェクトのオーナーシップを持つ。自分がそのオブジェクトの参照を無くすまで確実に参照することができる。デフォルトこの設定

## 弱参照

参照先のオブジェクトのオーナーシップを持たない。そのオブジェクトが破棄されたら参照できなくなる。delegate や blocks 使うときに主に使用

# 循環参照

二つのオブジェクト間で相互に強参照を持つと循環参照が起き、解放されないオブジェクトがうまれる。

![circular_reference](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.2/circular_reference.png)

この場合、片方の参照を弱参照にして回避します。

![circular_reference2](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.2/circular_reference2.png)

# 循環参照の例

```swift
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
```

[samples/day1/sample1-2/LeakSample](../../samples/day1/sample1-2)
