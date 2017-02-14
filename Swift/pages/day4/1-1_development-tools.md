> 参考 [mixi-inc/iOSTraining 10.1 開発ツール](https://github.com/mixi-inc/iOSTraining/wiki/10.1-%E9%96%8B%E7%99%BA%E3%83%84%E3%83%BC%E3%83%AB)

この章では、開発を進めて行く上で手助けとなる、Xcode付属の開発ツールについて紹介します。

具体的には、

- デバッガ
- パフォーマンス解析ツールであるInstruments
- 静的解析ツール

について紹介します。

解説には、次のプロジェクトを利用します。下記URLよりダウンロードしてXcodeで開いてください。

## デバッガ

XcodeにはiOSやOSX向けのコンパイラとしてCLangとLLVMが搭載されており、LLVMのデバッガであるLLDBをXcode上で使うことができます。
この節では、このLLDBを用いたデバッグの手法について紹介します。

#### ブレークポイントの設定と管理

**ブレークポイントを追加/削除**

- ソースコードの行番号をクリック  (行数がでない時は Preferences → Text Editing → Line Numbersにチェックを入れる)
- 追加したい行にカーソルを置いて`⌘+\`

のいずれかを行います。

![](./images/1_1/image1.png)

**ブレークポイントの管理**

デバッガの一覧はNavigatorのBreakPoint Navigatorで確認できます。

![](./images/1_1/image2.png)

#### デバッガの実行

では、18行目

```swift
let str = string(from: value)
```
にブレークポイントを設定した状態で実行してみましょう。次のような画面で止まると思います。
この画面について解説します。

![](./images/1_1/image3.png)


- Thread list (左側、縦長)
スレッドごとのスタックフレームを見ることができます。黒文字の箇所はプロジェクト内でビルドされたもので、クリックすることでスタックにジャンプできます
- DebugArea (下部)
  - 変数エリア
停止した段階での変数の値を確認することができます。自動変数、ローカル変数、レジスタを含んだグローバル変数の３種類の変数を閲覧できます。
  - コンソールエリア
普段は標準出力が表示されますが、デバッガのコンソールとしても使うことができます。LLDBのコマンドが使えます

詳しくはこちらをご覧下さい

[Use the debug area to control and inspect your running app](http://help.apple.com/xcode/mac/8.0/#/devda5478599)


#### ステップイン、ステップオーバーと変数のダンプ

ステップインは、停止中の行が関数だった場合にその関数の中に入りデバッグを続けます。ステップオーバーは関数を無視して次の行に進みます。ともに一行ずつ進めながらデバッグを行う方法です。

Xcodeでは以下のように実行できます。

- ステップイン : F7
- ステップオーバー : F6

![](./images/1_1/image4.png)

一行ずつデバッグを進めているとき、変数の中身は変数エリアで確認することができます。
- StringやArray, Dictionaryなどの変数の中身を確認することができます
  - `CustomStringConvertible protocol`を実装するか、`description`というpropertyをオーバーライドしていた場合その中身を確認することができます
  - このメソッドは`NSObject`を継承しているクラスであれば、どのクラスでもオーバーライドすることができます。デバッグが煩雑になってきたら書いてみましょう
- コンソールで'po 変数名'とコマンドを入力することで、変数の値をコンソールに出力することができます。

![](./images/1_1/image5.png)

また、メソッドのreturn valueも確認することができます。デバッガのステップアウトを行うと、次のように表示されます。
ステップアウトとは、ステップインした関数から抜けることです。F8で実行できます。

![](./images/1_1/image6.png)


#### デバッガコマンド

デバッガのコマンドはコンソールより実行することができます。

詳しいコマンドは下記に譲り、ここでは簡単にいくつかのコマンドを紹介します。

[http://lldb.llvm.org/lldb-gdb.html](http://lldb.llvm.org/lldb-gdb.html)

| コマンド | 説明 |
| ------ | -----|
| s, step | ステップイン |
| n, next | ステップオーバー |
| f, finish | ステップアウト |
| h | ヘルプを表示 |
| br | ブレークポイントを追加(要引数) |
| p foo | ローカル変数　p を表示 |
| po (式) | 式を評価 |
| po foo | [foo description] を表示 |
| bt | スレッドのバックトレースを表示 |

#### ブレークポイントにアクションを仕込む

ブレークポイントには、アクションを仕込むことが出来ます。
例えば、ある回数以上ヒットした時にストップする、変数の値を表示し続ける、などが可能です。

ブレークポイントで右クリックをするとEdit Breakpoint が表示されるので、そこから編集可能です。

![](./images/1_1/image7.png)

- condition には条件を入れます。その場で参照できる変数などを利用できます。
- Add Actionでアクションを追加します。
  - デバッガのコマンドやLogを指定して出力、AppleScriptなどが利用できます
- Automatically continue after evaluating にチェックを入れると自動的に続行します。

以下は、iが5より大きい時に、停止せずにstrの中身をコンソールに出力するときのブレークポイントです

![](./images/1_1/image8.png)

## Instruments

Instrumentsとは、Xcodeに付属するパフォーマンス解析ツールです。プロセスを追跡したり、アプリケーションの挙動に関するデータを集めることができる、非常に強力なツールです。Instrumentsを使うことで、アプリケーションに関して例えば次の項目を確認することができます。

- メモリの使用量
- リーク、オーバーリリースなインスタンス
- メソッドごとに要した処理時間
- システムコールの回数やタイミング
- ディスクI/Oの回数や処理時間
- 自動テスト
- グラフィックス(OpenGL)のパフォーマンス

この章では Instruments の中でもよく使う、Time Profilerと Memory Usage & Leaks について紹介します

なお、Instrumentsについての詳細なリファレンスについては、以下をご覧ください

[Instruments User Guide](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/)

#### Memory Usage & Leaks

それではInstrumentsを使って行きましょう。先ほどと同じプロジェクトを使います。view controller は主にMixiInstrumentsViewControllerを用います。

Instrumentsの起動は、⌘+I、もしくはXcode左上の Runボタンを長押しするとProfileが出てくるので、そこから実行できます。

![](./images/1_1/image9.png)

起動すると次のような画面があらわれます。この画面ではInstrumentsの機能のうち、どの項目を調査するのかを選ぶテンプレートとなっています。
今回はメモリリークについて調べるのでLeaksを選びます。

![](./images/1_1/image10.png)

選ぶとアプリケーションが実行され、次の画面が現れます。

![](./images/1_1/image11.png)

- 左側のバーは instruments pane と呼ばれトラックしているinstrumentsのタイプが表示されます
- instruments pane の右は track pane と呼ばれ、時刻ごとに各instrumentsがどのような値を取ったかを表示します
- 下部は detail pane と呼ばれ各instrumentsの詳細な情報を見ることができます。

メモリリークを見るにはinstruments pane の中からLeaksを選択します。

この状態で二つ目のタブを選択し、テーブルビューのセルをいくつかタップしてください。
しばらくすると、次のようなに変化すると思います。

![](./images/1_1/image12.png)


このとき detail pane に表れているのがリークしているオブジェクトです。Responsible Frameにめぼしいメソッドなどが表示されます。
右側にExtended Detailを表示するとそれぞれのメソッドがスタックフレームのように出力されます。
その中で、メソッドをダブルクリックするとリークの原因となっている箇所が表示されます。

![](./images/1_1/image13.png)

また、Detail Pane 上部から Cycle & Roots を選択すると参照関係をグラフィカルに確認することができます。

![](./images/1_1/image14.png)

これらの機能を用いて、メモリリークの原因を特定します。

#### Time Profiler

Instrumentsにある機能紹介、二つ目は Time Profilerです。Time Profiler では一定間隔ごとにCPU上で走っているプロセスのスタックトレースを取得します。それぞれのメソッドに対して、どれくらいの時間がかかったかを確認することができます。


サンプルプロジェクトの時間のかかり具合を見るために、一度iOSシミュレータにセットしてください。
Instrumentsを起動して、テンプレートから Time Profiler を起動します。起動したら、二つ目の画面で何度か上下にスクロールしてみてください。

次のような画面を見ることができると思います。

![](./images/1_1/image15.png)

Detail Pane には、どのスレッドでどれくらいの時間がかかったかが表示されています。
Extended Detail を選択すると、時間がかかっているメソッドの一覧をみることができます。

その中で時間を取っているメソッドをダブルクリックすると、どのメソッドのどの箇所でどれくらい時間を取っているかを見ることができます。

![](./images/1_1/image16.png)

この場合だと、

```swift
cell.textLabel?.text = formatter.string(from: Date())
```

あたりで時間を取っているのが分かるかと思います。


## Debug Memory Graph

Debug Memory Graph は Xcode8から使用可能になったObjectの参照を可視化できるツールです。メモリリークなどをXcode上からでも確認できます。
使い方は、アプリを実行中に Debug Memory Graph ボタンを押します。

![](./images/1_1/image17.png)

メモリリークを見るためには Show only leaked blocks にします。

![](./images/1_1/image18.png)

LeakObject同士がお互いに参照を持ち合っていることが確認できます。

このサンプルは[samples/day4/sample1-1](../../samples/day4/sample1-1)にあります。
