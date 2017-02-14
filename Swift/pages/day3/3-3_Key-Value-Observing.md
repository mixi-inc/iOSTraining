> 参考 [mixi-inc/iOSTraining 7.3 Key Value Observing](https://github.com/mixi-inc/iOSTraining/wiki/7.3-Key-Value-Observing)

[Introduction to Key-Value Observing Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html#//apple_ref/doc/uid/10000177i)

[キー値監視プログラミ ングガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/KeyValueObserving.pdf)

[NSKeyValueObserving Protocol Reference](https://developer.apple.com/reference/foundation/1657258-nskeyvalueobserving)

２オブジェクト間で、一方のオブジェクトでイベントが発生したときにもう一方のオブジェクトにメッセージを送る方法は大きく分けて三つあります。

| パターン | 特徴 |
|-----|----|
| delegate パターン ([1.4 参照](../../pages/day1/1-4-2_ModalViewController-xib.md)) | あるオブジェクトの処理を他のオブジェクトに委譲。一対一の関係 |
| Key Value Observing |  あるオブジェクトのプロパティの値を監視を登録し、そのプロパティの値に変化があった場合に通知を監視登録したオブジェクトは通知を受け取ることができる。|
| Notification、NotificationCenter を用いた通知 | NotificationCenter という仲介オブジェクトを介して、あるオブジェクトから通知登録しているあらゆるオブジェクトに通知することができる|

この章では KVO について解説します。下図は KVO の略図です。
![KVO](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/7.3/KVO.png)

## KVO の概要

KVO を実現するためには以下のステップが必要です

1. 監視したいオブジェクトのキー値に対して監視登録をおこなう
2. 監視対象に変化が起きたときの通知ハンドラーの実装
3. 監視登録の解除

## 1. キー値の監視登録

まず監視したい counter object を監視登録してみましょう。

```swift
Counter.shared.addObserver(self, // [1] 監視者
                forKeyPath: "count",  // [2] 監視対象のキー値
                   options: [.new, .old], // [3] オプションの指定
                   context: nil) //[4] 任意のオブジェクトを指定
```

### [1] 監視者

監視するオブジェクトを指定します。指定したオブジェクトに変化通知が届きます。  
監視するオブジェクトは`NSObject`である必要があります。

### [2] 監視対象のキー値

監視したいオブジェクトのどのプロパティの変化を監視するかを指定します。  
監視プロパティには、`dynamic`をつける必要があります。

### [3] オプションの指定

オプションを指定することで通知の際に取得できる値が変わってきます。
[NSKeyValueObservingOptions](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSKeyValueObserving_Protocol/Reference/Reference.html#//apple_ref/doc/c_ref/NSKeyValueObservingOptions)

### [4] 任意のオブジェクトを指定

任意のオブジェクトを指定することで、通知を受け取ったときにそのオブジェクトにアクセスすることができます。

## 2. 通知ハンドラーの実装

observer になったオブジェクトは、監視対象に変化があった場合このメソッドが呼び出されます。

```objective-c
override func observeValue(forKeyPath keyPath: String?,
                                    of object: Any?,
                                       change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?) {
    print(change)
}
```

例えば、監視対象の count の値がインクリメントされた場合以下のようなログがはかれます。

console log

```
Optional([__C.NSKeyValueChangeKey(_rawValue: new): 1, __C.NSKeyValueChangeKey(_rawValue: kind): 1, __C.NSKeyValueChangeKey(_rawValue: old): 2])
```

## 3. 監視登録の解除

例えば、監視者オブジェクトが破棄された時など監視する必要がなくなった場合は監視解除を行う必要があります。

```swift
deinit {
    Counter.shared.removeObserver(self, forKeyPath: "count")
}
```

※ `#keyPath`を使用して、登録や削除をするkeyPathを指定することも可能です。

```swift
Counter.shared.removeObserver(self, forKeyPath: #keyPath(Counter.count))
```

## 問題

下図の仕様を満たすように KVO を用いて実装してください。

![practice](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/7.3/practice.png)

この解答は[samples/day3/sample3-3](../../samples/day3/sample3-3)にあります。
