> 参考 [mixi-inc/iOSTraining 3.1 UIView](https://github.com/mixi-inc/iOSTraining/wiki/3.1-UIView)

[View Programming Guide for iOS](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/WindowsandViews/WindowsandViews.html) | [iOS Viewプログラミン グガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/ViewPG_iPhoneOS.pdf)

[UIView Class Reference](https://developer.apple.com/reference/uikit/uiview)

UIView クラスは大きく分けて以下の役割を持っています。

- 独自のコンテンツ描画 (画面上に表示するオブジェクトとしての役割)
- 各 View を管理するコンテナ
- アニメーション
- イベント処理 (タップやピンチインなど)

画面上に表示するもの自身としての役割と、階層構造で UIVeiwを管理している、という点をまず抑えてください。
以下では UIView の利用方法と仕組みについて説明します。

## コンテンツの描画

画面上にオリジナルのコンテンツを表示するまでを解説します。

### UIViewをコード上で利用する

UIViewの初期化は、「コード上で行う方法」と storybaord や xib のように 「Interface Builderを利用する方法」とがあります。
今までの章でstorybaord上にパーツを配置していた例がありますが、これが後者の「Interface Builderを利用する方法」にあります。

ここでは、コード上からUIViewを利用する方法を解説します。

##### 初期化

UIView のイニシャライザ は [`init(frame:)`](https://developer.apple.com/reference/uikit/uiview/1622488-init) で、このメソッドを用いて初期化を行います。
引数として渡す `frame` は CGRect型の値を渡します。CGRectは 原点(`origin`) と大きさ(`size`) の二つの要素を持つ構造体で、 UIViewの位置と大きさを定義して渡します。例えば以下のようにすると、原点が (10, 100), 大きさが (200, 50) のUIViewを作ることができます。

```swift
var frame: CGRect = .zero
frame.origin.x = 10
frame.origin.y = 100
frame.size.width = 200
frame.size.height = 50
let view = UIView(frame: frame)
```

##### プロパティ

UIViewにはいくつかのプロパティがあります。詳しくはクラスリファレンス([UIView Class Reference](https://developer.apple.com/reference/uikit/uiview))をごらんください。

よく利用するプロパティは例えば以下のようなものがあります。

| プロパティ名 | 解説 |
| ----------- | ---- |
| [backgroundColor](https://developer.apple.com/reference/uikit/uiview/1622591-backgroundcolor) | Viewの背景色を表すプロパティです。デフォルトでは透明です。Viewがちゃんと表示されているのかどうかの確認をしたい場合は適当な値を入れてデバッグなどをします。 |
| [isHidden](https://developer.apple.com/reference/uikit/uiview/1622585-ishidden) | Viewの表示/非表示 を切り替えるパラメータです。`view.isHidden = false` とするとViewが非表示になります。　|
| [frame](https://developer.apple.com/reference/uikit/uiview/1622621-frame),  [bounds](https://developer.apple.com/reference/uikit/uiview/1622580-bounds) | 共にViewの位置と大きさに関するプロパティです。frameは親Viewの座標系に対する位置と大きさ、boundsは自分の座標系に対する位置と大きさを返します。基本的にはframeで位置やサイズを調整するのでframeを利用するケースの方が多いです。 |

##### Viewを配置する

Viewを配置して画面上に表示します。iOSではViewを階層構造で管理していて、あるViewがあり、その上に重ねていく、という手順でViewを表示します。またこの際の注意点として必ず一つrootとなるviewが必要になります。

UIViewControllerを利用して画面を作ることが多いと思うのですが、UIViewControllerには一つviewが割り当てられているので、このviewに追加していきます。

viewを追加するには[`addSubview(_:)`](https://developer.apple.com/reference/uikit/uiview/1622616-addsubview)を利用します。

何かの ViewControllerのviewDidLoad あたりで実行してください。

```swift
let view = UIView(frame: ...) // UIViewの初期化
view.backgroundColor = .blue // デフォルトでは透明なので配置されてもわからない。そこで適当な色を入れておく
self.view.addSubview(view) // viewを追加. self.viewはUIViewControllerのプロパティ
```

### UIViewのサブクラス

アプリ内でコンテンツを表示しようとした時、UIViewのみでは矩形と背景色くらいしかパラメータがなく不便です。そこでUIKitには様々なUIViewのサブクラスが含まれています。よく利用するものについて以下で紹介します。

![img](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/subclassess.png)

(fig subclassess.png) 様々なViewを配置したサンプル

| クラス名 | 解説 |
| ----- | ------- |
| UILabel | view上にテキストを表示するサブクラスです。`label.text = "text comes here!!"` のようにしてテキストを表示することができます。リンクハイライトなどのリッチな表現の場合はUITextViewを利用します。 |
| UIButton | ボタンを表すクラスです。他のViewでもタップなどのインタラクションは取れるのですが、UIButtonはタップ時の暗転やタップ状態の判別も行ってくれます。何かボタンを設置する場合はこのクラスを使うケースが多いです。 |
| UITextField | １行のみの入力を行う際に利用するクラスです。入力された際の検知はUITextFieldDelegateを介して行います。|
| UIImageView | 画像を表示する際に利用するUIImageViewのクラスです。プロパティのimageにUIImageインスタンスを渡すことで画像を表示できます。|
| UITextView | リッチなテキストの表示、入力を行う際に利用するクラスです。テキストの変更などはUITextViewDelegateを利用して取得します。 |

### 演習 1

上の図(subclassess.png)のように幾つかのViewを表示するアプリケーションを作ってみてください。
UIImageViewに表示する画像は何でも構いません。サンプルで利用した図は [images/2_1/ojisan.png](./images/2_1/ojisan.png) にあるのでこちらでも構いません。
ベースとなるプロジェクトの制約も特にありません。

解答は [after/day2/2.1/ViewSample](../../after/day2/2.1/ViewSample)にあります。

**ヒント**
* Viewを追加できているか不安なときはbackgroundColorを代入するとよくわかります。(その色の物が表示されていればviewは表示されている)
* viewのサブクラスごとに表示の方法が違うので注意が必要です。例えば UILabelにテキストをセットするときは `label.text = ...` で表示できますが、UIButtonではできません。それぞれの使い方はリファレンスを調べたり、検索したりしてください。



## subViews

ある viewA に重ねられた viewB は ViewA の SubView となります。viewB は viewA の subViews に管理されます。

![subViews](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/subViews.png)

### 演習

演習 1 の続きを利用します。演習 1で複数のUIコンポーネントを配置したと思います。その中から UIImageView だけを取り除いてください。その際、subviewに含まれる各viewがUIImageViewのクラスかどうかを判断して取り除いてください

**ヒント**
- for の高速列挙を使ってください。`for view in subviews { .... }`
- `obj is UIView` を使うことで obj が UIView クラスなのかを判定できます。
- UIViewを取り除く時は `view.removeFromSuperview()` を使ってください

解答は演習1の解答と同じく[after/day2/2.1/ViewSample](../../after/day2/2.1/ViewSample) に含まれています。FirstViewController.swift の中にコメントアウトされているので、そのコメントアウトを外すと確認できます。


## tag

UIView インスタンスは Int の tag というプロパティを持っています。ここに数値をセットすることで、View を高速に検索することが出来ます。

```swift
if let subview = view.viewWithTag(8) {
    //取得できたら入る
}
```
このコードを実行することで view とその subView を深さ優先検索し該当 view があればそこで検索を終了します。

また、タグを使うことによって、ボタンのイベント処理を一つのメソッドにまとめることが出来ます。

![tag](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/tag.png)

このような場合、sender.tag で処理を振り分けることで、ボタンごとにメソッドを宣言実装する必要がなくなります。

## view の追加／削除

今までに出てきた addSubview/removeFromSuperView の他にも view を insert するメソッドがあります。

* `insertSubview(_:at:)`  subViews の index を指定
* `insertSubview(_:aboveSubview:)`  指定の view の上に insert
* `insertSubview(_:belowSubview:)`  指定の view の下に insert
* `exchangeSubview(at:withSubviewAt:)`  subView の入れ替え、remove してから addSubview するよりも高速

## view の座標系

iOS では左上を座標の起点とします。
> ![origin](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/origin.png)

> [iOS Viewプログラミン グガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/ViewPG_iPhoneOS.pdf) から引用

frame

![frame-bounce-center](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/frame-bounce-center.png)

viewの位置や大きさを変更する場合はframeプロパティを変更します。

```swift
// 原点(10, 20)、width = 30, height = 40
view.frame = CGRect(x: 10, y: 20, width: 30, height: 40)
```

## 引き延ばし可能な view

View の stretch 機能を使うことで画像の引き延ばし可能領域を設定することが出来ます。

Interface Builder 上で設定する場合は Stretching の部分の数値を変更することで設定可能です。

- x, y : 起点から **引き延ばし不可能 ** な領域の割合を設定します
- Width, Height : x, y で決めた点から **引き延ばし可能** な領域を設定します。


![stretch](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/3.1/stretch.png)

画像リンク[circle](https://raw.github.com/mixi-inc/iOSTraining/master/SampleProjects/3.1/MixiViewSample/MixiViewSample/circle.png)
