# MRR(manual retain-release)
## MRRとは
Objective-c言語で利用されていた
所有するオブジェクトを追跡することによって、  
明示的にメモリを管理するメモリ管理方法のことです。

インスタンスへの参照回数のことを参照カウントといいます。

> ![reference count](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/MemoryMgmt/Art/memory_management_2x.png)

[Advanced Memory Management Programming Guide](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html) から引用

Objective-C ではインスタンスへの参照カウントが1以上であれば
メモリ領域が確保され続けインスタンスは生存し続けます。

alloc/init: 参照カウントを1に設定します。
retain: 参照カウントを+1します。  
release: 参照カウントを-1します。

# ARC(Automatic Reference Counting)
## ARCとは
Swiftでも利用されているメモリ管理方法のことです。
上記の retain, release など参照カウントを上下させるコードをコンパイラが自動で補完してくれる仕組みのことです。

> ![ARC](https://developer.apple.com/library/mac/releasenotes/MacOSX/WhatsNewInOSX/Art/ARC_design_final.gif)

> [Programming With ARC Release Notes](http://developer.apple.com/library/mac/#releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_7.html) から引用

# オーナーシップ
参照には **強参照** と **弱参照** があります。

## 強参照

参照先のオブジェクトのオーナーシップを持っています。自分がそのオブジェクトの参照を無くすまで確実に参照することができます。swif3では変数を宣言するとデフォルトでは強参照として宣言されます。

## 弱参照

変数宣言時にweakを付けると弱参照として設定されます。弱参照は参照先のオブジェクトのオーナーシップを持ちません。そのオブジェクトが破棄されると参照できなくなります。delegate や blocks などの利用時に登場する事が多いです。

# 循環参照

二つのオブジェクト間で相互に強参照を持つと循環参照が起き、解放されないオブジェクトが生まれてしまいます。

![circular_reference](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.2/circular_reference.png)

この場合、片方の参照を弱参照にして回避します。

![circular_reference2](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.2/circular_reference2.png)

# 循環参照の例

```swift
// ParentObjectのインスタンスへの強参照をparentObjが所持
var parentObj: ParentObject? = ParentObject()

// ChildObjectのインスタンスへの強参照をchildObjが所持
var childObj: ChildObject? = ChildObject()

// parentObjのインスタンス変数がchildObjへの強参照を保持
parentObj?.object = childObj
//childObjのインスタンス変数がparentObjへの強参照を保持
childObj?.object = parentObj

// parentObj.objectが弱参照の場合:
// parentObjにnilを代入すると、parentObjがParentObjectのインスタンスへの参照を解除（解放）
// childObjがnilになるので、childObjがChildObjectのインスタンスを解放
parentObj = nil


// parentObj.objectが強参照の場合:
// parentObjにnilを代入しても、childObj.objectがParentObjectのインスタンスの強参照を保持
parentObj = nil
```

# 課題

実際に強参照と弱参照でどのように参照の流れが変化するかを確かめてみましょう。

[samples/day1/sample1-2/LeakSample](../../samples/day1/sample1-2)

## 強参照の場合
1. parentObjにnilを代入する
2. print()メソッドを利用して、childObj.objectがParentObjectクラスの参照を保持している確認する

## 弱参照の場合
1. ParentObjectクラスのobjectプロパティにweakを宣言して弱参照にする
2. parentObjにnilを代入して確認する
3. print()メソッドを利用して、childObj.objectがParentObjectの参照を保持しているか確認する
