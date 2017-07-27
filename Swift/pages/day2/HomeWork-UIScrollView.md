> 参考 [mixi-inc/iOSTraining HomeWork 3.1 UIScrollView](https://github.com/mixi-inc/iOSTraining/wiki/HomeWork-3.1-UIScrollView)

ここでは、iOSにおけるviewの中でもよく使われるUIScrollViewの紹介と、UIScriollViewを用いた課題です

# UIScrollView紹介

## UIScrollViewとは

iOSのViewに入りきらないViewを表示するためにviewの一部を切り出してくれるviewです。

**もう少し詳しく**

- WebViewのように縦とか横にスクロールする画面
- 写真アプリなどで画像を拡大縮小するとき
- スワイプして次のページにというページング

などのシーンで使われます。画面内をスクロールするなど、とても使用頻度の高いview componentです

公式ドキュメントはこちら
[UIScrollView Class Reference](https://developer.apple.com/reference/uikit/uiscrollview)

## UIScrollViewの仕組み

UIScrollViewは、自分のサイズより大きなsubviewの一部を切り出して表示する役割を持っています。どの位置(厳密にはどのframe)を表示するかを指定することもできます。

そこでスクロールして画面をはみ出るコンテンツを表示したいときは、 画面のview → scroll view → コンテンツのview という階層構造でviewを構築することで実現できます。viewと同じサイズのscroll view を貼付け、scrollviewの中をコンテンツのviewが動き回ると言うイメージです。

例として下の画像のview階層を見てみましょう。

![scroll view の階層](https://raw.github.com/mixi-inc/iOSTraining/HEAD/Doc/Images/HomeWork/how_to_use_scrollview.png)

アプリの画面(view)に、そのサイズより大きい画像(imageView)を貼付けるとします。
この場合、アプリの画面(view)の下にscrollViewを追加し、scrollViewの下にimageViewを追加しています。コードで書くと、

```swift
view.addSubview(scrollView)
scrollView.addSubview(imageView)
```
となります。



# 実際に動かしてみる

上の例を実装することで、scrollViewの動作を確認してみましょう。
リポジトリのSwift/before/day2/homework以下にある ScrollViewSample を開くか、Xcodeから新しいプロジェクトをテンプレートをSingle View Applicationで開き、こちらの画像をプロジェクトに追加してください。

画像のURL → [https://raw.github.com/mixi-inc/iOSTraining/master/HomeWorks/3.1/scrollViewSample/scrollViewSample/big_image.jpg](https://raw.github.com/mixi-inc/iOSTraining/master/HomeWorks/3.1/scrollViewSample/scrollViewSample/big_image.jpg)

以下の手順をviewDidLoad内に書き進めて行ってください

###### 1. scroll view を貼る

```swift
let scrollView = UIScrollView(frame: view.frame)
view.addSubview(scrollView)
```

  - scrollview の インスタンスを生成して、self.viewに追加します。
  - この時、scrollviewのframe(原点とサイズ)はself.viewと同じにします。そうすることで、画面全体にscrollviewを表示できます。
  - この時点では実行しても何も表示されません

###### 2. imageViewの準備

  - 画像を扱うimageviewについては次回以降で触れるので、今回は以下のコードを使ってください。

  ```swift
  let image = UIImage(named:"big_image")!
  let scale = UIScreen.main.scale
  let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
  let imageView = UIImageView(frame:CGRect(origin: .zero, size: size))
  imageView.image = image
  ```

 - 画像の大きさ(800,600)と同じ大きさのimageViewを作っています

###### 3. imageViewをscrollviewに貼付ける

  - 2.で準備したimageViewをscrollviewに貼付けます。

  ```swift
  scrollView.addSubview(imageView)
  ```

  - 以下のような状態になると思います。 しかし、まだスクロールはできないと思います。

  ![https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_1.png](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_1.png)

  - `scrollView.contentSize = imageView.frame.size` とすることでスクロールできるようになると思います。
  - scrollviewに表示するコンテンツのサイズを教えないとスクロールできる領域が分からず、スクロールできないのでご注意ください。

スクロール出来るとこんな感じに→ ![https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_2.png](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_2.png)

###### 4. 拡大縮小
  - imageViewを拡大縮小するには次の三点を記述する必要があります
     - 拡大する最大の倍率の指定
     - 拡大する最小の倍率の指定
     - UIScrollViewDelegateの準拠
  - 倍率の指定はそれぞれ以下のように指定します

  ```swift
    scrollView.maximumZoomScale = 3 // 最大倍率
    scrollView.minimumZoomScale = 0.5 // 最小倍率
  ```

  - delegateの準拠は以下の手順を踏みます
     - ヘッダファイルの@interface部で `class ViewController : UIViewController, UIScrollViewDelegate { ... }` としてScrollViewDelegateを準拠
     - scrollViewを作った所(おそらくviewDidLoadだと思います)の中でdelegateをselfにセット

     ```swift
     scrollView.delegate = self
     ```

     - UIScrollViewDelegateのメソッドである`func viewForZooming(in scrollView: UIScrollView) -> UIView?` の実装

      ```swift
      func viewForZooming(in scrollView: UIScrollView) -> UIView? {
          for imageView in scrollView.subviews where imageView is UIImageView {
              return imageView
          }
          return nil
      }
      ```

このメソッドはscroll view がスケーリングしたときに、拡大or縮小するviewを返すメソッドです。
今回は、画像を貼付けたimageViewを拡大したいので、UIImageViewのクラスのものを返します。
  - 以上で拡大縮小もできるようになると思います。シミュレータ上でのピンチインアウトはoptionを押しながら画面上でカーソルを引っ張ると可能です:)

めいっぱい縮小した図→![https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_3.png](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/HomeWork/scrollview_3.png)

### Tips :

- あれ？うまく動かないというときは
- 画像が正しく表示されているか確認しましょう。意外とtypoしてたりします。
  - image が nil でないことを確認する。画像ファイル名が間違っている時はnilになります。
  - `self.view.addSubview(imageView)` とすることでscrollviewに原因があるかを特定できます。画像が表示されたらscrollviewに原因があります。
- インスタンスのクラスの確認方法
  - `type(of: obj)` で Classを得ることができます。
  - あるインスタンスがある特定のクラスか確認するには `is` を使います。
    - 例)`string is String`

# まとめ

scroll view を使う時のまとめ、注意点です

- 画面をはみ出るコンテンツにはUIScrollViewを使う
  - viewにscrollviewを張り、はみ出る大きなviewをscrollviewに貼る
  - この階層構造が大切
- スケーリングするときはコンテンツのサイズを scrollview.contentSize で指定する
- 拡大縮小するときは、倍率とdelegateへの準拠が必要


# 課題

UIScrollViewにはさらにいくつかのオプションやメソッド、delegate method があります。それをふまえた課題です

- 現在のscrollviewのコンテンツの位置をscrollする度にprintで出力してください
- 起動時に、アニメーション付きで自動的にあるポジションへ移動させてください。
- ステータスバー(上部の時計や電波強度を示すバー)をタップすると一番上にスクロールできるようにしてください

**UIScrollViewについてはこちらをどうぞ**
- [https://developer.apple.com/reference/uikit/uiscrollview#//apple_ref/occ/cl/UIScrollView](https://developer.apple.com/reference/uikit/uiscrollview#//apple_ref/occ/cl/UIScrollView)
- [https://developer.apple.com/reference/uikit/uiscrollviewdelegate](https://developer.apple.com/reference/uikit/uiscrollviewdelegate)
