> 参考　[mixi-inc/iOSTraining 10.2 CocoaPods](https://github.com/mixi-inc/iOSTraining/wiki/10.2-CocoaPods)

CocoaPodsはOSX, iOSの両方で使うことのできる、ライブラリマネージャです。 RubyのGem, node.jsのnpmと同等の物と考えていただいて差し支えないと思います。
このページでは、このCocoaPodsを用いたライブラリ管理の方法と、いくつかライブラリを紹介します。

CocoaPodsの公式サイトは下記になります。詳細はこちらをご覧ください。

[https://cocoapods.org/](https://cocoapods.org/)

# CocoaPodsの導入と利用

#### インストール

- RubyのGemを用いてインストールします。
  - RubyはおそらくCommandLineToolsを入れた時に入っていると思います
  - Gemもおそらく10.8以降なら入っていると思います

コマンドラインツールで以下を実行します
```
[sudo] gem install cocoapods
pod setup
```

しばらく時間がかかると思います。

#### Podfileの記述

利用するライブラリやそのバージョンの指定、ターゲットごとのライブラリの振り分けなどはPodfileというファイルに記述します。

```
# Podfile

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CocoaPodsSample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CocoaPodsSample
  pod 'Reachability'
  pod 'Alamofire'
end
```

または`pod init`コマンドをプロジェクトと同階層で実行すると、Podfileが生成されます。

- platformは対応するプラットフォームを書きます、iosとosxが選択でき、OSのバージョンを指定する場合はコンマに続けてバージョンを書きます
- targetには適用するターゲットを指定します。ビルドするターゲットごとに使用するライブラリを変えたい場合は書きます。全てのターゲットで利用する場合は必要ありません
- 利用するライブラリを指定するには

```
pod 'ライブラリ名', バージョンや他のpodを指定
```

と書きます。
  - バージョンの表記はRubyGemsのバージョン表記に準拠します。
  - ローカルにあるライブラリを指定したい場合は

```
pod 'MyLibrary', :local => 'path/to/libary'
```

のように書きます
  - gitで管理されているライブラリを利用する場合

```
pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git'
```

のように指定します。
  - podspecが記述されている場合

```
pod 'Alamofire', :podspec => 'https://raw.githubusercontent.com/Alamofire/Alamofire/master/Alamofire.podspec'
```

と書くことが出来ます。



#### インストール

ライブラリのインストールには

```
pod install
```

とします。プロジェクト配下にPodsというディレクトリができてその中にライブラリがインストールされます。

インストール後のプロジェクトファイルは hogehoge.xcodeproj から hogehoge.xcworkspace に変更になります。xcodeporjを使うとライブラリを参照できません

あとはソースコード内で

```
import Alamofire
```

とすれば利用できるようになります。


# CocoaPodsのライブラリの紹介

#### Reachability

iPhoneのネットワーク接続状況を確認することのできるライブラリです。

- 端末自体の接続状況
- ホストごとの接続状況
- ネットワークのタイプ(WWAN, Wifi)

などを確認することができます。下記のように使います。

```swift
let reachability = Reachability.forInternetConnection()!
let status = reachability.currentReachabilityStatus()

switch status {
case .NotReachable:
    print("not reachable")
case .ReachableViaWiFi:
    print("wifi")
case .ReachableViaWWAN:
    print("wwan")
}
```

#### MisterFusion

MisterFusionは、NSLayoutConstraintの長くなってしまいがちなコードを短くすることができます。

インストールには

```
pod 'MisterFusion'
```

としてください。

例えば、ViewControllerのviewをに対したて、あるViewを上下左右のスペースを10ずつでレイアウトしたい場合、普通のコードだと

```swift
let view = UIView()
self.view.addSubview(view)
view.translatesAutoresizingMaskIntoConstraints = false
self.view.addConstraints([
    NSLayoutConstraint(item: view, attribute: .top,    relatedBy: .equal, toItem: self.view, attribute: .top,    multiplier: 1, constant:  10),
    NSLayoutConstraint(item: view, attribute: .right,  relatedBy: .equal, toItem: self.view, attribute: .right,  multiplier: 1, constant: -10),
    NSLayoutConstraint(item: view, attribute: .left,   relatedBy: .equal, toItem: self.view, attribute: .left,   multiplier: 1, constant:  10),
    NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -10),
])
```

となりますが、MisterFusionでは

```swift
let view = UIView()
self.view.addLayoutSubview(view, andConstraints:
    view.top    |+| 10,
    view.right  |-| 10,
    view.left   |+| 10,
    view.bottom |-| 10
)
```

となります。

#### SwiftyJSON

SwiftyJSONはDictionaryやArrayのElementを取り出したあとの煩わしいcastを軽減するライブラリです。

```
pod 'SwiftyJSON'
```

でインストールできます。

例えば、サーバーから取得したJsonをパースして使おうとしたときに

```swift
if let JSONObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: AnyObject]],
    let username = (JSONObject[0]["user"] as? [String: AnyObject])?["name"] as? String {
        // There's our username
}
```

のようにoptional chainingのキャストになってしまいますが、SwiftyJSONを使うと

```swift
let json = JSON(data: dataFromNetworking)
if let userName = json[0]["user"]["name"].string {
  //Now you got your value
}
```

このように、コードをわかりやすくすることができます。

#### その他

その他に、いくつか有用そうなフレームワークを名前だけですが紹介します。
- Alamofire
  - iOS, OSX用のネットワークライブラリです。HTTPリクエストに加えて、キャッシュ機構やストリーミング、JSONやplistに対応した通信などを行います
  - [https://github.com/Alamofire/Alamofire](https://github.com/Alamofire/Alamofire)

- Kingfisher
  - 非同期かつキャッシュを行う画像通信用のライブラリ。
  - URLを指定すると、キャッシュに含まれている場合はキャッシュから、ない場合はURLに問い合わせます
  - [https://github.com/onevcat/Kingfisher](https://github.com/onevcat/Kingfisher)

- テストフレームワークなど
  - テストフレームワークやテスト用のライブラリもCocoa Pods 経由で入れることができます
  - テストについては、次の11回で紹介します

もっと見たい！と言う方は以下からCocoaPods/Specsに登録されているライブラリを確認することができます。

またCocoaPodsでは、Swiftに限らずObjective-Cのライブラリも管理でき、Swiftのファイルから使うことができます。

https://github.com/CocoaPods/Specs

サンプルは[samples/day4/sample1-2](../../samples/day4/sample1-2)にあります。
