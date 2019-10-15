> 参考 [mixi-inc/iOSTraining 5.4 KeyboardNotification](https://github.com/mixi-inc/iOSTraining/wiki/5.4-KeyboardNotification)

[Keyboard Notification User Info Keys](https://developer.apple.com/reference/uikit/uiwindow#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keyss)

[Text Programming Guide for iOS](https://developer.apple.com/library/content/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009542-CH1-SW1)

コンテンツを投稿する画面などで Keyboard の表示非表示によってレイアウトを変更する必要がある場面があります。

![keyboardNotification](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/5.4/keyboardNotification.png)

この際に、UIKeyboardNotification に登録することで、登録したオブジェクトで keyboard 通知を受け取ることが出来るようになります。

## NSNotification.Name.UIKeyboardWillShow 通知登録

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
}

func keyboardWillShow(_ notification: NSNotification) {
    print(notification.userInfo)
}
```

console

```
[
    AnyHashable("UIKeyboardCenterBeginUserInfoKey"): NSPoint: {187.5, 796},
    AnyHashable("UIKeyboardIsLocalUserInfoKey"): 1,
    AnyHashable("UIKeyboardCenterEndUserInfoKey"): NSPoint: {187.5, 538},
    AnyHashable("UIKeyboardBoundsUserInfoKey"): NSRect: {{0, 0}, {375, 258}},
    AnyHashable("UIKeyboardFrameEndUserInfoKey"): NSRect: {{0, 409}, {375, 258}},
    AnyHashable("UIKeyboardAnimationCurveUserInfoKey"): 7,
    AnyHashable("UIKeyboardFrameBeginUserInfoKey"): NSRect: {{0, 667}, {375, 258}},
    AnyHashable("UIKeyboardAnimationDurationUserInfoKey"): 0.25
]
```

Dictionaryの値の中に`NSPoint`や`NSRect`が入っているので、[NSValue](https://developer.apple.com/reference/foundation/nsvalue)にキャストしてから`CGRect`や`CGPoint`を取得します。

### 問題

下の図の仕様を満たすアプリケーションを作成してください。

![keyboardNotificationPractice](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/5.4/keyboardNotificationPractice.png)

**ポイント**

- keyboardWillHide という通知名でキーボード非表示通知登録
- Viewのframeを変更するだけではなく、constraintを変更することでもアニメーションが可能です
  - Interface Builderから任意のconstraintをIBOutletとして紐付ける
  - 任意のconstraintのconstantに変更したい値を代入する
  - Viewのsuperviewの`layoutIfNeeded()`をアニメーションのclosure内で実行する
