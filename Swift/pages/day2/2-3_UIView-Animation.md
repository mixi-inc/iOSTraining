> 参考 [mixi-inc/iOSTraining 3.3 UIView Animation](https://github.com/mixi-inc/iOSTraining/wiki/3.3-UIView-Animation)

UIView クラスのアニメーションメソッドを使うことで簡単に View のアニメーションを実装することができます。

## view アニメーション可能なプロパティ

> プロパティ | 可能な変更
> --- | ---
> frame | スーパービューの座標系を基準にビューのサイズと位置を変更する場合 は、このプロパティを変更します(transformプロパティに恒等変換が 含まれていない場合は、代わりにboundsまたはcenterプロパティを変 更します)。
> bounds | ビューのサイズを変更する場合は、このプロパティを変更します。
> center | スーパービューの座標系を基準にビューの位置を変更する場合は、このプロパティを変更します。
> transform | 中心点を基準にビューを拡大縮小、回転、または平行移動する場合は、 このプロパティを変更します。このプロパティを使用する変換は、常に2D空間で実行されます(3D変換を実行するには、Core Animationを使用 してビューのレイヤオブジェクトをアニメーション化する必要があります)。
> alpha | ビューの透明度を徐々に変更する場合は、このプロパティを変更します。
> backgroundColor | ビューの背景色を変更する場合は、このプロパティを変更します。
contentStretch | 利用可能な空間一杯にビューのコンテンツを引き延ばす方法を変更する場合は、このプロパティを変更します。
>
> [iOS Viewプログラミングガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/ViewPG_iPhoneOS.pdf)より引用

## アニメーションブロック

UIView のクラスメソッドには以下のアニメーションメソッドが用意されています。
* `animate(withDuration:animations:)` アニメーションブロック
* `animate(withDuration:animations:completion:)` アニメーションブロックと完了ブロック
* `animate(withDuration:delay:options:animations:completion:)` アニメーションブロックと完了ブロックとアニメーションオプション指定、ディレイ指定

画像を実際にアニメーションさせてみましょう。

FirstViewController.swift

```swift
private struct Const {
    static let ojisanMovedFrame = CGRect(x: 320, y: 586, width: 170, height: 170)
}

@IBOutlet weak var ojisanImageView: UIImageView!

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    UIView.animate(withDuration: 2, animations: {
        self.ojisanImageView.frame = Const.ojisanMovedFrame
    }, completion: nil)
}
```

このサンプルは [before/day2/2.3/AnimationSample](../../before/day2/2.3/AnimationSample) に含まれています。

### 問題

アニメーション完了後に画像を元に位置に戻るアニメーションを実装して下さい。（HINT:<font color="#ffffff">アニメーションブロックのネスト</font>）

解答はサンプルプロジェクト [after/day2/2.3/AnimationSample](../../after/day2/2.3/AnimationSample) です。

## view の transition

View の追加、削除、表示、非表示などの際にトランジションを使用することでユーザに視覚的変化を与えることができます。

SecondViewController.swift

```swift
private struct Const {
    static let ojisanInitialFrame = CGRect(x: 85, y: 115, width: 170, height: 170)
}

private var ojisanImageView1: UIImageView?
private var ojisanImageView2: UIImageView?

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let ojisanImageView1 = UIImageView(image: UIImage(named: "ojisan"))
    ojisanImageView1.frame = Const.ojisanInitialFrame
    view.addSubview(ojisanImageView1)
    self.ojisanImageView1 = ojisanImageView1

    let ojisanImageView2 = UIImageView(image: UIImage(named: "ojisan"))
    ojisanImageView2.frame = Const.ojisanInitialFrame
    view.addSubview(ojisanImageView2)
    ojisanImageView2.isHidden = true
    self.ojisanImageView2 = ojisanImageView2
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    UIView.transition(with: view, duration: 3, options: .transitionCurlUp, animations: {
        self.ojisanImageView1?.isHidden = true
        self.ojisanImageView2?.isHidden = false
    }, completion: nil)
}
```

## begin/commit
アニメーションブロックを使わずにアニメーションを設定することも可能です。

ThirdViewController.swift

```swift
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    UIView.beginAnimations("hideOjisanView", context: nil)
    UIView.setAnimationCurve(.easeIn)
    UIView.setAnimationDuration(2)
    UIView.setAnimationDelegate(self)
    UIView.setAnimationDidStop(#selector(type(of: self).showHideDidStop(_:finished:context:)))
    ojisanImageView.alpha = 0
    UIView.commitAnimations()
}

@objc func showHideDidStop(_ animationId: String?, finished: Bool, context: UnsafeMutableRawPointer) {
    UIView.beginAnimations("showOjisanView", context:nil)
    UIView.setAnimationCurve(.easeOut)
    UIView.setAnimationDuration(1)
    UIView.setAnimationDelay(1)
    ojisanImageView.alpha = 1
    UIView.commitAnimations()
}
```
