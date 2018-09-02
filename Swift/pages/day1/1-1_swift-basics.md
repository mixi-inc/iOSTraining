# Swiftの基礎

## まず始めに

|日付|出来事|
|:---|:---|
|2014年06月|WWDC2014にてSwiftを発表|
|2014年08月|Swift 1.0|
|2014年10月|Swift 1.1|
|2015年04月|Swift 1.2|
|2015年06月|WWDC2015にてSwiftのオープンソース化を発表|
|2015年09月|Swift 2.0|
|2015年10月|Swift 2.1|
|2016年03月|Swift 2.2|
|2016年12月|Swiftオープンソース化 [swift.org](https://swift.org/)|
|2016年09月|Swift 2.3、Swift 3.0|

APIの振る舞いに関して疑問を持ったら、[公式API Reference](https://developer.apple.com/reference)を見ましょう。  
またはXcodeのソースコード上で型にカーソルをあわせて`command`を押しながらクリックすると  
APIの宣言を見ることができます。

## Swiftの型が持つ振る舞い

Swiftの基本的な型は値を保持するだけでなく、振る舞いを持っています。

```swift
Int.max
123.45.remainder(dividingBy: 100)
```

## コメント

一行

```swift
// コメントです
```

複数行

```swift
/*  コメントです
    コメントです
    コメントです  */
```

## 四則演算

上2つは四則演算が正常に実行されますが、下2つは演算子が間違っているというエラーになります。

```swift
123+456   //579
123 + 456 //579
123+ 456  //error: '+' is not a postfix unary operator
123 +456  //error: ambiguous use of operator '+'
```

## 文字列

ダブルクォーテーションで囲むこてで文字列として認識されます。

```swift
print("Hello World!")
```

`+`演算子を使うことで文字列同士を結合することができます。

```swift
print("Hello " + "World!")
```

## `let`と`var`

Swiftでは`var`で変数を、`let`で定数を宣言できます。

`var 変数名: 型 = 式`  
`let 定数名: 型 = 式`

```swift
var a: Int = 1
let b: Int = 2
a = b
print(a) // 2
b = a // Cannot assign to value: 'b' is a 'let' constant
```

上記のサンプルのように、mutable(可変)な`a`に対して同じ型の`b`を再代入することができます。  
しかし、immutable(不変)な`b`に対して同じ型である`a`であっても再代入することはできません。

## 文字列と変数の組み合わせ

`"\(変数)"`や`String(変数)`などを使うことで、変数を文字列として扱うことができます。

```swif
let a: Int = 700 + 55
let b: String = "Hello \(a)!"
let c: String = "Hello " + String(a) + "!"
```

## 数値を扱う型

### 符号付き整数

```swift
let maxValue1: Int   = Int.max
let minValue1: Int   = Int.min
let maxValue2: Int8  = Int8.max
let minValue2: Int8  = Int8.min
let maxValue3: Int16 = Int16.max
let minValue3: Int16 = Int16.min
let maxValue4: Int32 = Int32.max
let minValue4: Int32 = Int32.min
let maxValue5: Int64 = Int64.max
let minValue5: Int64 = Int64.min
```

Swiftは型が厳密なので、たとえ`Int`同士に見えたとしても  
`let value: Int = Int64.max`  
のような代入は行なえません。  
`let va: Int = Int(Int64.max)`  
のように同じ型で初期化することで代入可能になります。

### 符号なし整数

```swift
let maxValue1: UInt   = UInt.max
let minValue1: UInt   = UInt.min
let maxValue2: UInt8  = UInt8.max
let minValue2: UInt8  = UInt8.min
let maxValue3: UInt16 = UInt16.max
let minValue3: UInt16 = UInt16.min
let maxValue4: UInt32 = UInt32.max
let minValue4: UInt32 = UInt32.min
let maxValue5: UInt64 = UInt64.max
let minValue5: UInt64 = UInt64.min
```

同様に、`let value: Int = UInt.max`のような代入は行なえません。  

### 浮動小数点数

```swift
let value1_1: Float  = 12.34   //32bitの範囲で値を保持
let value1_2: Float  = -12.34  //32bitの範囲で値を保持
let value2_1: Double = 123.45  //64bitの範囲で値を保持
let value2_2: Double = -123.45 //64bitの範囲で値を保持
```

同様に、`let value: Double = Float(12.34)`のような代入は行なえません。

### 真偽値

真偽値は`true`と`false`で表現します。

```swift
let value: Bool = true
```

## 型推論

数値を代入するときは、`let value: Int = 10`のように型を指定していました。  
Swiftには型推論があるので、`let value = 10`という宣言の仕方もできます。

```swift
print(type(of: 10))     //Int
print(type(of: 123.45)) //Double
```

型を指定せずに`10`を代入した場合は、`Int`になります。  
また`123.45`のように小数点を代入すると、`Double`になります。

```swift
let value: Int = .max
```

上記のように宣言時に型を指定している場合、型推論によって`.max`という代入も可能です。

## 配列

### Mutable（可変）な配列

```swift
var 変数名: [型] = [値]
```

### Immutable（不変）な配列

```swift
let 変数名: [型]　= [値]
```

```swift
//Mutableな配列
var array1: [String] = [String]()
array1.append("iPhone6")
array1 += ["iPhone6s"]
//Immutableな配列
let array2: [String] = []
array2.append("iPhone7") //要素を追加できない
//Immutableな配列
let array3: [String] = ["iPhoneSE", "iPhone6plus"]
```

## 辞書

### Mutable（可変）な辞書

```swift
var 変数名: [型:型] = [値:値]
```

### Immutable（不変）な辞書

```swift
let 変数名: [型:型]　= [値:値]
```

```swift
//Mutableな配列
var dict1: [String : String] = [String : String]()
dict1["iPhone6s"] = "docomo"
dict1["iPhone7"] = "au"
//Immutableな配列
let dict2: [String : String] = [:]
dict2["iPhone6plus"] = ["softbank"] //要素を追加できない
//Immutableな配列
let dict3: [String : String] = ["iPhone6s" : "docomo", "iPhone7" : "au", "iPhone6plus" : "softbank"]
```

## Optional型

Swiftで値がない状態を保持するために`nil`を使います。  
しかし、Swiftでは変数生成時にnilを指定することは許可されていません。  
そのため、nilを代入可能にするために`Optional型`を使います。  
型の後ろに`?`をつけることで、Optional型を使うことができます。

```swift
var value: String? = nil
```

`String?`は`Optional<String>`なので、`String`と違う型になるため`String`の変数に代入することはできません。  
そのため、optional bindingを使ってunwrapします。

```swift
var value: String? = nil
value = "Apple"
print(value) //Optional("Apple")
if let v = value {
  print(v) //Apple
}
```

また、変数の後ろに`!`をつけることで、強制的にunwrap（force unwrap）することができます。

```swift
var value: String? = nil
value = "Apple"
print(value) //Optional("Apple")
print(value!) //Apple
```

しかしforce unwrapを使うと、変数がnilであった場合に実行時エラーになってしまうので、あまり使わないようにしましょう。

また`??`を使うことでもunwrapすることができます。

```swift
var value: String? = nil
value = "Apple"
let newValue = value ?? ""
print(newValue) //Apple
```

上記の例の場合、valueがnilでなかったらvalueをunwrapを代入し、nilだった場合には空文字列を代入するという結果になります。

## ImplicitlyUnwrappedOptional型

変数がnilである可能性があったとしても、unwrapせずに使いたい場合があるかと思います。  
その場合は`ImplicitlyUnwrappedOptional型`を使うことで、アクセスする際に暗黙的にアンラップされます。
型の後ろに`!`をつけることで、ImplicitlyUnwrappedOptional型を使うことができます。

```swift
var value: String! = nil
value = "Apple"
print(value) //Apple
```

Optional型をforce unwrapした際と同様に、変数がnilであった場合に実行時エラーになってしまうので注意しましょう。  

ここで注意しなければならないのは、`String!`は`ImplicitlyUnwrappedOptional<String>`なので  
optionalな値をforce unwrapする際の`value!`とは、同じ記号を使っていても違った意味になります。

## メソッド

```swift
func メソッド名(引数名: 型) -> 戻り値の型 {
    //処理
}
```

```swift
func show(year: Int) {
    print("\(year)年10月26日")
}

show(year: 1985) //メソッド呼び出し
```

```swift
func メソッド名(引数の別名 引数名: 型) -> 戻り値の型 {
    //処理
}
```

```swift
func show(firstTimetravelYear year: Int) {
    print("\(year)年10月26日")
}

show(firstTimetravelYear: 1985) //メソッド呼び出し
```

```swift
func showYear(_ year: Int) {
    print("\(year)年10月26日")
}

showYear(1985) //メソッド呼び出し
```

[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)

## class

Swiftのclassではプロパティとメソッドを定義することができます。

```swift
class Dog {
    var name: String = ""

    func bark() {
        print("わんわん")
    }
}
```

classのインスタンス化は下記のように行います。

```swift
let dog = Dog()
dog.name = "ポチ"
dog.bark()
```

classの継承は下記のように行います。

```swift
class PoliceDog: Dog {
    override func bark() {
        super.bark()
        print("逮捕しちゃうぞ")
    }

    func arrest() {
        print("\(self.name)は犯人を捕まえた")
    }
}
```

class内で、class自身のpropertyにアクセスしたい場合は   
`self.property名`または`property名`  
でアクセスすることができます。

## struct

structはclassとほぼ同じことができますが、継承することができません。  
またclassは参照渡しなのに対してstructは値渡しなので   
メソッドの引数にオブジェクトを渡した際や別な変数に代入した際にコピーされます。

```swift
struct Person {
    var name: String
    var age: Int

    mutating func comesBirthday() {
        age += 1
    }
}
```

structでは自身のプロパティの値を自身のメソッドで変更する際、`mutating`にしなければなりません。

structのインスタンス化は下記のようになります。

```swift
let person = Person(name: "ドク", age: 65)
```

定義したproperty名が自動的にinitializerの引数になります。  

```swift
let person = Person(name: "ドク", age: 65)
person.age = 66 //エラー
```

structではpropertyがvarで定義されていたとしても  
インスタンス化する際にvarになっていなければ、値を変更することはできません。  

また新たにinitializerを定義することもできますが、自動的に生成されるinitializerは使用できなくなります。  
そして定義されているpropertyすべてinitializer内で初期化する必要があります。

```swift
struct Person {
    var name: String
    var age: Int

    init() {
        name = "ドク"
        age = 65
    }
}
```

## propertyの値を監視

`wiiSet`や`didSet`を使うことで、propertyの値の変更を監視することができます。

```swift
class Person {
    var name: String = ""
    var age: Int = 0 {
        willSet {
            print("\(age)から\(newValue)に変わります")
        }
        didSet {
            print("\(oldValue)から\(age)に変わりました")
        }
    }
}

let person = Person()
person.age = 1 //0から1に変わります 0から1に変わりました
person.age = 2 //1から2に変わります 1から2に変わりました
```

`willSet`では、これから入ってくる値が`newValue`になっていて  
`didSet`では、前回入っていた値が`oldValue`になっています。

## getter / setter

オブジェクトのpropertyに対して、getter / setterを実装することができます。

```swift
class Person {
    var name: String = ""
    private(set) var _age: Int = 0
    var age: Int {
        set {
            _age = newValue
        }
        get {
            return _age
        }
    }
}

let person = Person()
person.age = 1
print(person._age)
person.age = 2
print(person._age)
```

setterを実装すると、値を保持できるpropertyでなくなります。

## generics

クラス、構造体、列挙で使用する任意の型を定義することができます。

```swift
struct Stack<T> {
    fileprivate var items: [T] = []
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stack = Stack<String>()
stack.push(item: "Apple")
stack.push(item: "iPhone")
print(stack.items) //["Apple", "iPhone"]
stack.pop()
print(stack.items) //["Apple"]
```

## enum

```swift
enum enum名: 型名 {
    case 列挙子
}
```

自動的にinitializerが生成されますが列挙した値に対応しない値が渡されることもあるので  
返り値の型はOptional型になっています。

```swift
enum Gender: Int {
    case man = 0
    case female = 1
}

let gender = Gender(rawValue: 0)
```

Intに限らず、型にStringなど指定できます。

```swift
enum Gender: String {
    case man = "man"
    case female = "female"
}

let gender = Gender(rawValue: "man")
```

型を指定せずに使うこともできます。

```swift
enum Fruit {
    case apple
    case orange
}
```

列挙子に対して変数を持たせることも可能です。([`Associated Values`](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html))

```swift
enum MyOptional<T> {
    case none
    case some(T)
}

let value: MyOptional<String> = .some("optinal value")
print(value)

if case .some(let string) = value {
    print(string)
}
```

## tuple

複数の値を一組にすることができます。

```swift
let item: (String, Int, Double, Int) = ("iPhone7 128GB", 83800, 0.08, 90504)
print("商品: \(item.0)")
print("税抜き価格: \(item.1)")
print("消費税: \(item.2)")
print("合計: \(item.3)")
```

また以下のように名前付きtupleは下記のように記述します。

```swift
let item: (name: String, price: Int, tax: Double, total: Int) = ("iPhone7 128GB", 83800, 0.08, 90504)
print("商品: \(item.name)")
print("税抜き価格: \(item.price)")
print("消費税: \(item.tax)")
print("合計: \(item.total)")
```

## extension

既存のclass（またはstruct、enum）や独自のclass（またはstruct、enum）に対して  
メソッドなどを拡張することができます。

```swift
extension Person {
    func introduce() {
        print("私は\(name)です。\(age)歳です。")
    }
}
```

## protocol

protocolはクラスに実装するプロパティとメソッドを指定する機能になります。  
protocolで宣言されているプロパティやメソッドを実装してないとエラーになります。  
またprotocolにもextensionが使えるので、デフォルト実装も可能です。  
メソッドがデフォルト実装された場合、protocolを適用したクラスでそのメソッドを実装する必要はなくなります。

```swift
protocol Animal {
    var name: String { get set }
    var barkString: String { get set }
    func bark()
}

extension Animal {
    func bark() {
        print(barkString)
    }
}

class Dog: Animal {
    var name: String = ""
    var barkString: String = "わんわん"
}

class Cat: Animal {
    var name: String = ""
    var barkString: String = "にゃー"
}

let dog = Dog()
dog.name = "ポチ"
dog.bark()

let cat = Cat()
cat.name = "たま"
cat.bark()
```

> 参考 WWDC2015の[Protocol-Oriented Programming](https://developer.apple.com/videos/play/wwdc2015/408/)のセッション

## closure

```swift
let 変数名: (引数の型) -> (戻り値の型) = { (引数:引数の型) -> (戻り値の型) in
    // 処理
    return 戻り値
}

# もしくは引数に名前を振って可読性を高めたい場合は以下のようにも書ける
let 変数名: (_ 引数: 引数の型) -> (戻り値の型) = { (引数:引数の型) -> (戻り値の型) in
    ....
}
```

```swift
let addFunc: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

# もしくは
let addFuncLabeled: (_ a: Int, _ b: Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = addFunc(1, 2)
print(result)  // 3
```

ちなみに引数も戻り値もない場合は下記のように書きます。

```swift
let simpleClosure = { () -> () in
    let a = 1 + 1
    print(a) // 2
}
# もしくは
let simpleClosure = { () -> Void in
    ....
}
```


## try-catch

throwするメソッドのエラーをハンドリングするためには  
do内でtryをして、エラーが起きた際にはcatch内で処理をします。

```swift
do {
    let json = try JSONSerialization.jsonObject(with: Data(), options: [])
    print(json)
} catch let e {
    print(e)
    //Error Domain=NSCocoaErrorDomain Code=3840 "No value." UserInfo={NSDebugDescription=No value.}
}
```

`try?`を使うことで、エラーが発生してもoptional bindingのように扱うことができます。

```swift
if let json = try? JSONSerialization.jsonObject(with: Data(), options: []) {
    print(json)
}
```

## for文

Swift3では、C言語スタイルのfor文と`++`及び`--`が使用できなくなりました。  
[Remove C-style for-loops with conditions and incrementers](https://github.com/apple/swift-evolution/blob/master/proposals/0007-remove-c-style-for-loops.md)

```swift
// C言語スタイルのfor文
for var i = 0; i < 10 ; i++ {
    print(i)
}
// 0 1 2 3 4 5 6 7 8 9
```

```swift
for i in 0..<10 {
    print(i)
}
// 0 1 2 3 4 5 6 7 8 9
```

```swift
for i in 0...10 {
    print(i)
}
// 0 1 2 3 4 5 6 7 8 9 10
```

降順でループをすすめたい場合には、`reversed()`を使います。

```swift
for i in (0..<10).reversed() {
    print(i)
}
// 9 8 7 6 5 4 3 2 1 0
```

また`forEach`をつかうことで、closure内でループの結果を受けることができます。

```swift
(0..<10).forEach({ i in
    print(i)
})
// 0 1 2 3 4 5 6 7 8 9
```

数値が1ずつ増加していくものではない場合は、`stride`を使います。

```swift
// C言語スタイルのfor文
for var i = 0; i < 10 ; i += 2 {
    print(i)
}
// 0 2 4 6 8
```

```swift
for i in stride(from: 0, to: 10, by: 2) {
    print(i)
}
// 0 2 4 6 8
```

```swift
for i in stride(from: 0, through: 10, by: 2) {
    print(i)
}
// 0 2 4 6 8 10
```

`for case in`を使うことで条件に当てはまる値の場合のみ処理を行います。  
また`for in where`を使うことでも条件に当てはまる値の場合のみ処理を行います。

```swift
enum Fruit {
    case apple, orange
}

let fruits: [Fruit] = [.apple, .orange, .apple, .orange]
//Appleのときのみ処理を行う
for case .apple in fruits {
    print("りんごです")
}
//Appleのときのみ処理を行う
for fruit in fruits where fruit == .apple {
    print("りんごです")
}
```

## switch-case

Swiftのswitch-caseの場合、breakを書かなくても下の処理に流れることはありません。  
ただ、何の処理も行わない場合はbreakを書く必要があります。

```swift
let value = 100
switch value {
case 0:
    print("0です")
case 1...100:
    print("1〜100です")
default:
    break
}
```

```swift
enum Fruit {
    case apple
    case orange
}

let value: Fruit = .apple
switch value {
case .apple:
    print("りんごです")
case .orange:
    print("オレンジです")
}
```

Swiftでfallthroughするためには、`fallthrough`を明記します。

```swift
let value = "apple"
switch value {
case "apple":
    print("りんごです")
    fallthrough //次のcase文の処置も実行する
case "orange":
    print("オレンジです")
default:
    print("どちらでもない")
}
```

> 参考 [Swiftでswitch文(case)を使う方法 – 応用編(範囲, fallthrough, タプル)](http://swift.tecc0.com/?p=363)

## guard

```swift
guard 条件文 else {
    無効であった場合の処理
}
```

guard文の条件に合わなかった場合は、guard文内で処理を記述し

- return
- break
- continue
- throw

の該当するいずれかを書く必要があります。

optional bindingを行った場合は、値が取得できたときの変数のスコープはguard文の外になります。

```swift
var value: String? = nil
value = "Apple"
guard let v = value else {
    return
}
print(v)
```

## キャスト（as）

`as`を使うことで、キャストを行うことができます。

```swift
class Dog {
    var name: String = ""
}

class PoliceDog: Dog {

}

if let policeDog = dog as? PoliceDog {
    print(policeDog)
}
```

上記では`Dog`型で定義されている変数dogが、`PoliceDog`型であれば値がoptional bindingが成功してif文の中に入ります。  
また`as!`を使うことで、強制的にキャストを行うこともできます。

```swift
print(dog as! PoliceDog)
```

`as!`でキャストをしようとして型が異なった場合は、実行時エラーになるのであまりおすすめしません。

## Access Control

|アクセス修飾子|内容|
|:---|:---|
|open|同じモジュールだけでなく、別のモジュールからもアクセスができ、別のモジュールで継承またはオーバーライドができる|
|public|同じモジュールだけでなく、別のモジュールからもアクセスができ、別のモジュールで継承またはオーバーライドができない|
|internal|同じモジュール内からのみアクセスできる|
|fileprivate|同じソースファイル内からのみアクセスできる|
|private|定義されたスコープ内でのみアクセスできる|

```swift
class Person {
    private(set) var name: String = "Doc"
}

let person = Person()
print(person.name) //ファイルにアクセルはできる
person.name = "Marty" //再代入はできない
```

上記の場合は、`name`のアクセスは同じモジュール内可能ですが、`name`に値を代入可能なスコープはPersonクラス内のみになります。

## filter

条件にマッチする要素のみを取り出したい場合に使用します。

```swift
let evenNumbers = [1,2,3,4,5,6,7,8,9,10].filter({ value in
    return value % 2 == 0
})
print(evenNumbers)
```

## map

配列内の要素に処理を適用し、その処理を施した配列を使いたい場合に使用します。

```swift
let doubleNumbers = [1,2,3,4,5,6,7,8,9,10].map({ value in
    return Double(value)
})
print(doubleNumbers)
```

## reduce

要素使って結果を集計したいような場合に使用します。

```swift
let queryParameter = ["name=doc", "gender=0", "age=65"].reduce("", { result, value in
    if result.isEmpty {
        return "?" + value
    }
    return result + "&" + value
})
print(queryParameter)
```

## flatMap

配列内の要素に処理を適用し、その処理を施したものがnilでない配列を使いたい場合に使用します。

```swift
enum Gender: Int {
    case man = 0
    case female = 1
}

let genderList = [0, 1, 2, 3, 0, 1].flatMap({ value in
    return Gender(rawValue: value)
})
print(genderList)
```

# 課題

## 課題1

[HelloWorld.playground](../../before/day1/1.1/HelloWorld.playground)を開き、force unwrapを使わずに"Hello World!"を表示してください。

## 課題2

以下のデータ構造を持つオブジェクトを再現してください。(クラス化などはしなくても結構です)

```
{
    "users" : [
        {
            name : "Dr. Emmett Brown",
            gender : 1,
            era : 1985,
            age : 65,
            visits: [
                1885, 1955, 1985, 2015
            ]
        },
        {
            name : "Marty McFly",
            gender : 1,
            era : 1985,
            age : 17,
            visits: [
                1885, 1955, 1985, 2015
            ]
        },
        {
            name : "Lorraine Baines",
            gender : 0,
            era : 1955,
            age : 18,
            visits: null
        }
    ]
}
```

[JSON.playground](../../before/day1/1.1/JSON.playground)

## 課題3

課題2で作成したオブジェクトをクラス化してください。

[Users.playground](../../before/day1/1.1/Users.playground)
