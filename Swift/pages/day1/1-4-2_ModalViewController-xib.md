> 参考 [mixi-inc/iOSTraining 1.4 UIViewController2 ModalViewController](https://github.com/mixi-inc/iOSTraining/wiki/1.4-UIViewController2---ModalViewController)

参考 : [UIViewController Class Reference](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIViewController_Class/Reference/Reference.html) | [View Controller Programming Guide for iOS](http://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ViewControllerPGforiOS.pdf)

# 概要

ModalViewController は一時的にユーザの操作の中に割り込んで表示させるもの。公式ドキュメントには以下のようなケースで使うことを想定している。

- ユーザから直ちに情報を収集するため
- 何らかのコンテンツを一時的に表示するため
- 作業モードを一時的に変更するため
- デバイスの向きに応じて代替のインターフェイスを実装するため
- 特殊なアニメーショントランジションを使用する(またはトランジションなしの)新しいビュー 階層を表示するため

UIViewController は一つの ModalView を表示することが可能。そのときに、Modal を表示する ViewController と ModalViewController には親子関係が出来る。

> ![modal1](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/Art/VCPG_SlideTransition_fig_8-1_2x.png)
>
> [View Controller Programming Guide for iOS](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/PresentingaViewController.html) から引用

また、ModalViewController の上に ModalViewController をだすこともできる。

> ![modal2](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/Art/VCPG-presented-view-controllers_2-3_2x.png)  
> [View Controller Programming Guide for iOS](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/TheViewControllerHierarchy.html#//apple_ref/doc/uid/TP40007457-CH33-SW1) から引用

# 表示方法

```swift
let postViewController = PostViewController()
present(postViewController, animated: true, completion: nil)
```

## 表示オプション

- modalTransitionStyle 画面遷移の方法

```swift
public enum UIModalTransitionStyle : Int {
    case coverVertical
    case flipHorizontal
    case crossDissolve
    case partialCurl
}
```

- modalPresentationStyle - iPad の場合に表示形式を変更できる

```swift
public enum UIModalPresentationStyle : Int {
    case fullScreen
    case pageSheet
    case formSheet
    case currentContext
    case custom
    case overFullScreen
    case overCurrentContext
    case popover
    case none
}
```

# 消し方と delegate

## dismissViewController

```swift
dismiss(animated: true, completion: nil)
```
このメソッドを呼べば、トップレベルの ModalViewController が dismiss されます。公式ドキュメントには原則として呼び出した ViewControlelr が消すべきと書いてあります。状況に応じて使い分けてください。

![dismissViewController](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.5/dismissViewController.png)

## delegate と protocol

ChildViewController で閉じるボタンを押したことを ViewControlelr が知る必要があります。このようにある VC から VC へ何らかの通知を送る手段の一つとして delegate があります。

![delegate](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/1.5/delegate.png)

delegate とはあるクラスで処理できない処理を他のクラスに代わりに処理させるパターンです。この場合、ChildViewController でボタンが押されたイベントだけキャッチし、ChildViewController を閉じる処理は ViewController に任せることにします。

ChildViewController.swift
```swift
protocol ChildViewControllerDelegate: class { // [1] プロトコルの宣言
    func childViewController(_ viewController: PostViewController, didTapCloseButton button: UIButton)
}

class ChildViewController : UIViewController {

    weak var delegate: ChildViewControllerDelegate? // [2] delegate オブジェクト

    // 中略

    @IBAction func pressClosedButton(_ sender: UIButton) {
        // [3] delegate オブジェクトにメッセージを送信
        delegate?.childViewController(self, didTapCloseButton: sender)
    }

    // 中略
}
```

### [1] protocol

プロトコルはメッソド宣言の集合体です。上記では、ChildViewController が ChildViewControllerDelegate というプロトコルで、他のクラスに任せたいメソッドを宣言しています。

### [2] delegate オブジェクト

実際に処理を任せたいクラスのインスタンスが代入されています。ChildViewControllerDelegate を採用しているオブジェクトの代入することを条件づけることが出来ます。この場合 ViewController が入ります。ViewController は自身で ChildViewController の参照を持つので、こちらで weak property にしておかないと循環参照が起きます。

### [3] delegate オブジェクトにメッセージを送信

delegate 先に delegate method が実装されているかを確認します。実装されていれば、実際にメッセージを送ります。

ViewController.swift
```swift

class ViewController : UIViewController, ChildViewControllerDelegate {} // [4] protocol の採用
    // 中略

    @IBAction func pressModalButton(_ sender: UIButton) {
        let *childViewController = ChildViewController()
        childViewController.delegate = self; // [5] delegate 先として自身を代入
        present(childViewController animated:YES completion:nil)
    }

    // [6] delegate method の実装
    // MARK: - ChildViewControllerDelegate methods
    func childViewController(_ viewController: ChildViewController, didTapCloseButton button: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    // 中略
}
```

### [4] protocol の採用

複数ある場合は "," でつなげます。

ViewController.swift
```swift
class ViewController : UIViewController, ChildViewControllerDelegate, AaaDelegate, BbbDelegate {
    // 中略
}
```

### [5] delegate 先として自身を代入

これを忘れると ChildViewController から通知を受け取ることが出来ませんのでお忘れなく。

### [6] delegate method の実装

protocol の採用をすることで method の補完が効くようになります。

# 注意事項

Modal の 表示、非表示アニメーションが同時に起きるとアニメーションの衝突でクラッシュするので気をつけてください。
