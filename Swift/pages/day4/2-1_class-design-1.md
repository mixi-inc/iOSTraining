> 参考 [mixi-inc/iOSTraining 9.1 クラス設計 1](https://github.com/mixi-inc/iOSTraining/wiki/9.1-%E3%82%AF%E3%83%A9%E3%82%B9%E8%A8%AD%E8%A8%88-1)

[Concepts in Objective-C Programming](https://developer.apple.com/library/ios/#documentation/General/Conceptual/CocoaEncyclopedia/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010810)

[Objective-Cプログラミングの概念](https://developer.apple.com/jp/devcenter/ios/library/documentation/CocoaEncyclopedia.pdf)

iOS アプリケーション開発は MVC フレームワークを採用しています。最近ではMVVMだったり、Fluxだったりと様々な設計方法がありますが、まずはiOSアプリ設計の基本としてMVCをやっていきます。

- Model
  - View を構成する情報を保持
  - 必要に応じて、APIClient でリモートから情報を取得したり、DB にアクセスして情報を取得する

- View
  - Model のデータを表示
  - ユーザから操作を受ける

- Controller
  - Model と View を結びつけるもの
  - Model に更新メッセージを送り、Model からその完了通知を受ける
  - View に Model の情報を送り、View を通じてユーザからの操作を受ける

> ![MVC](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/9.1/MVC.png)
> [Objective-Cプログラミングの概念](https://developer.apple.com/jp/devcenter/ios/library/documentation/CocoaEncyclopedia.pdf) から引用

iOS の MVC フレームワークは上のような形をとります。View と Model を完全に切り離している理由は、View の再利用性を高めるためです。

各レイヤーで効率的に開発するためのポイントを解説します。

## Model

複雑で大量な情報の取得、管理する必要がある Model は、Controller がそのデータにアクセスしやすいように設計する必要があります。

### 情報の取得するためのインタフェースを作成する

Model は Controller から情報取得のメッセージを受けられるようにします。そのメッセージを受けて Model はローカルやリモートから情報の取得を行います。従って Model ではローカルの情報へアクセスする処理や、HTTP クライアントを用いてリモートから情報を取得する実装をします。

### Entity クラスで情報を管理する

取得してきた情報の各エントリは Entity クラスに定義し、そのインスタンスを Model に管理させるとよいでしょう。例えば Model クラスオブジェクトが API クライアントを用いて以下のような JSON を取得したとします。

```json
{
    "total_count": 188872,
    "incomplete_results": false,
    "items": [
        {
            "id": 22458259,
            "name": "Alamofire",
            "owner": {
                "login": "Alamofire",
                "id": 7774181,
                "avatar_url": "https://avatars.githubusercontent.com/u/7774181?v=3",
                ・・・
            },
            "description": "Elegant HTTP Networking in Swift",
            "created_at": "2014-07-31T05:56:19Z",
            "updated_at": "2016-11-06T03:20:15Z",
            "stargazers_count": 20222,
            "watchers_count": 20222,
            "forks_count": 3463,
            ・・・
        },
        ・・・
    ]
}
```

> [https://api.github.com/search/repositories?q=language%3Aswift&sort=stars](https://api.github.com/search/repositories?q=language%3Aswift&sort=stars) より引用

Model オブジェクトはレスポンスで取得したこの JSON をそのまま Array で管理するのではなく、各エントリごとに entity オブジェクトを生成して管理します。以下は entity オブジェクトの例です。

GithubModel.swift

```swift
protocol GithubModel {
    init?(dict: [AnyHashable : Any])
}

struct GithubRepository: GithubModel {
    let name: String
    let owner: GithubUser
    let `description`: String
    let stargazersCount: Int
    let forksCount: Int
    let watchersCount: Int
    let createdAt: Date
    let updatedAt: Date

    init?(dict: [AnyHashable : Any]) {
        guard
            let name = dict["name"] as? String,
            let rawOwner = dict["owner"] as? [AnyHashable : Any],
            let owner = GithubUser(dict: rawOwner),
            let description = dict["`description`"] as? String,
            let stargazersCount = dict["stargazers_count"] as? Int,
            let forksCount = dict["forks_count"] as? Int,
            let watchersCount = dict["watchers_count"] as? Int,
            let rawCreatedAt = dict["created_at"] as? String,
            let rawUpdatedAt = dict["updated_at"] as? String
        else { return nil }

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"

        guard
            let createdAt = dateFormatter.date(from: rawCreatedAt),
            let updatedAt = dateFormatter.date(from: rawUpdatedAt)
        else { return nil }

        self.name = name
        self.owner = owner
        self.description = description
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.watchersCount = watchersCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

struct GithubUser: GithubModel {
    let avatarUrl: URL
    let login: String

    init?(dict: [AnyHashable : Any]) {
        guard
            let rawAvatarUrl = dict["avatar_url"] as? String,
            let avatarUrl = URL(string: rawAvatarUrl),
            let login = dict["login"] as? String
        else { return nil }

        self.avatarUrl = avatarUrl
        self.login = login
    }
}
```

Model オブジェクトはこの GithubRepository を配列で管理するようにします。そうすることで Controller 側でも参照しやすくなり、可読性も上がります。

## View

Controller クラスファイル作成時にその xib ファイルを生成するかStoryboard上にViewControllerを配置しましょう。Interface Builder を使うことで、Controller に view オブジェクト生成やレイアウトのコードを記述しなくてもよくなり可読性があがります。

また、day2 2.x 系の研修で行った UIView またはそのサブクラスを作成し、独自の view component 作成すれば、あらゆる場面でその view の再利用が簡単に行えます。

## Controller

Controller にはあらゆる処理が集中しがちです。コードが肥大化してくる多くは *ViewController.swift* です。

### ロジック部分は極力別クラスに移す

Controller で if ~ else ~ という多くのロジックが入る可能性があります。例えば以下のような仕様があったとします。

- ファーストビューので、曜日ごとに違う画像をオーバーレイしたい
- その画像をタップした際の画面遷移やアクションが画像によってことなる

ここで考えられることは、
- 今何曜日なのかを判定し、画像を生成して Controller が表示する
- 各曜日ごとのイベントハンドラを実装し、画像のイベントを Controller が受け取る

これを全て Controller で実装すると確実に肥大化していきます。このような時はビジネスロジックを別クラスに移しましょう。

#### 曜日を判定するカテゴリ

Date クラスのカテゴリとして作成すれば、任意の Date オブジェクトに対して曜日を求めることが出来ます。

Date+Day.swift

```swift
extension Date {
    enum DayOfWeek: Int {
        case unknown
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }

    func dayOfWeek() -> DayOfWeek {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let weekdayComponents = gregorianCalendar.dateComponents([.day, .weekday], from: self)
        if
            let weekday = weekdayComponents.weekday,
            let dayOfWeek = DayOfWeek(rawValue: weekday)
        {
            return dayOfWeek
        }
        return .unknown
    }
}
```

#### UIImageView インスタンスを生成する Factory クラス

DailyImageViewCreator.swift

```swift
class DailyImageViewCreator {
    class func imageView(with dayOfWeek: Date.DayOfWeek) -> UIImageView {
        //do something
  }
}
```

#### 画面遷移ロジックを別クラスで実装

イベントハンドラをすべて Controller で実装すると Controller が肥大化します。このようにイベントハンドラでいっぱいになってしまった場合、画面遷移を管理するクラスを生成し、Controller の参照を渡してそのクラスで処理を行うようにします。そうすると、Controller のコードの可読性は上がりますし、画面遷移の処理も一カ所にまとめることが可能になります。

TransitionHandler.swift

```swift
class TransitionHandler {
    class func pushSecondViewController(with viewController: UIViewController) {
        let vc = UIViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }

    class func pushThirdViewController(with viewController: UIViewController) {
        //do something
    }

    class func presentSecondViewController(with viewController: UIViewController) {
        //do something
    }

    class func presentThirdViewController(with viewController: UIViewController) {
        //do something
    }
}
```
