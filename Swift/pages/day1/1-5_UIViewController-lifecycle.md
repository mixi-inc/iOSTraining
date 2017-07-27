> 参考 [mixi-inc/iOSTraining 1.5 UIViewController3 ライフサイクル](https://github.com/mixi-inc/iOSTraining/wiki/1.5-UIViewController3---%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB)

参考 : [UIViewController Class Reference](https://developer.apple.com/reference/uikit/uiviewcontroller) | [ViewController プログラミングガイド](https://developer.apple.com/jp/documentation/ViewControllerPGforiOS.pdf)

## ライフサイクル

UIViewControllerが生成され、表示、レイアウト調整、非表示、破棄のようにUIViewControllerは状態がいくつか遷移します。
その一連の流れのライフサイクルについて解説します。

[samples/day1/sample1-5](../../samples/day1/sample1-5)
に簡単なサンプルアプリがあります。

### 生成

UIViewControllerの生成方法はいくつかあります。

| メソッド | 呼ばれるケース |
| -------- | -------------- |
| [`init(coder:)`](https://developer.apple.com/reference/foundation/nscoding/1416145-init) | UIViewControllerのイニシャライザではなく、準拠しているNSCodingプロトコルのメソッドです。storyboardから生成される場合はこのメソッドが呼ばれます。 |
| [`init(nibName:bundle:)`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621359-init) | UIViewControllerのレイアウトを記述したxibからViewControllerを生成する際に呼ばれるメソッドです。 |
| [`init`](https://developer.apple.com/reference/objectivec/nsobject/1418641-init) | NSObjectのイニシャライザです。UIViewControllerでこのメソッドを呼んだ場合、内部で`init(nibName:bundle:)`などを呼ばなければviewのインスタンスが生成されません。 |

初期化のメソッドも複数あるので、呼び出し方、呼び出され方を意識してイニシャライザを記述する必要があります。
またこれらのイニシャライザが呼ばれた段階ではViewControllerとしてのインスタンスは生成されていますがviewのインスタンスは生成されていません。
そのために、これらのイニシャライザの中でviewのレイアウトをすることはできないので注意が必要です。

```swift
required init?(coder aDecoder: NSCoder) {
    //Optionalでないpropertyの初期化をここで記述する
    super.init(coder: aDecoder)
}

override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    //Optionalでないpropertyの初期化をここで記述する
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
}

init() {
    //Optionalでないpropertyの初期化をここで記述する
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
}
```

viewの読み込みが完了すると [`viewDidLoad()`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621495-viewdidload) が呼ばれます。
この段階ではviewのインスタンスが準備できているのでレイアウトや追加のコードを挿入することもできます。
このメソッドはviewの読み込みが完了した一回のみ呼び出されます。

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    print("viewDidLoad")
}
```

### 表示

インスタンスが生成され、viewが表示されるタイミングでは
[`viewWillAppear(_:)`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621510-viewwillappear)
と
[`viewDidAppear(_:)`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621423-viewdidappear)が呼ばれます。それぞれ、viewが表示される直前とviewが表示完了した直後に呼ばれます。例えばアニメーションを行ってViewControllerを表示する場合、

`viewWillAppear(_:)` → 表示アニメーション → `viewDidAppear(_:)` の順に呼び出されます。

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
}
```

これらのメソッドは表示される度に呼び出されます。例えばモーダルで新しいViewControllerを表示して、モーダルを閉じると
再び画面が表示されるのでこれらのメソッドが呼ばれます。

### レイアウトの調整

UIViewControllerのviewのレイアウトの調整が何度か行われます。
例えばstoryboardやxibから読み出した状態ではviewControllerのサイズはそのstoryboardやxibでレイアウトを記述したときのサイズで読み出されるので、画面サイズに合わせて調整が行われます。
他にも、画面を回転したときにもレイアウトの調整などが行われます。この時にこれらのメソッドが呼び出されます。

```swift
override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("viewWillLayoutSubviews")
}

override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("viewDidLayoutSubviews")
}
```

### 非表示

ViewControllerインスタンスが非表示になるとき、なった時にそれぞれ [`viewWillDisappear(_:)`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621485-viewwilldisappear)、[`viewDidDisappear(_:)`](https://developer.apple.com/reference/uikit/uiviewcontroller/1621477-viewdiddisappear)が呼ばれます。
表示の時と同様に、それぞれ非表示になる直前、直後に呼ばれます。遷移アニメーションとの組み合わせは

 `viewWillDisappear(_:)` → 遷移アニメーション → `viewDidDisappear(_:)`

のようになります。このメソッドも非表示になる度に呼ばれ、何度も呼ばれる可能性があります。

```swift
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear")
}

override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear")
}
```

### viewの表示、非表示の状態遷移

> ![Figure 1Valid State Transitions](https://docs-assets.developer.apple.com/published/f06f30fa63/UIViewController_Class_Reference_2x_ddcaa00c-87d8-4c85-961e-ccfb9fa4aac2.png)  
> [UIViewController Class Reference](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIViewController_Class/index.html)より

### 破棄

オブジェクトが誰からも参照されなくなり、メモリから解放されるときに`deinit`が呼ばれます。
UIViewController固有のものではなくSwiftのclassで実装できるメソッドになります。

```swift
deinit {
    print("deinit");
}
```
