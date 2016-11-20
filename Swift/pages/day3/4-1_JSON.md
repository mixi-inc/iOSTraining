> 参考 [mixi-inc/iOSTraining 6.2 JSONのシリアライズとデシリアライズ](https://github.com/mixi-inc/iOSTraining/wiki/6.2-JSON%E3%81%AE%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%E3%81%A8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA)

WebAPIやJSONRPCを利用する際、よくフォーマットとして利用されるのがJSONです。Foundation FrameworkにもJSONのシリアライズやデシリアライズを行うクラスが含まれています。この章ではそのクラスの利用法を説明します。

クラスリファレンスはこちら [https://developer.apple.com/reference/foundation/jsonserialization](https://developer.apple.com/reference/foundation/jsonserialization)

# JSONSerialization

JSONのシリアライズ、デシリアライズを行うクラスはJSONSerializationです。このクラスを用いてData <--> JSONオブジェクトを変換するには以下の制約があります。

> - トップレベルオブジェクトはNSArrayかNSDictionaryである
> - 全てのオブジェクトは, NSString, NSNumber, NSArray, NSDictionary, NSNull いずれかのインスタンスである
> - 全ての辞書のキーはNSString
> - 数値はNaNや無限でない
>
> [JSONSerialization Class Reference](https://developer.apple.com/reference/foundation/jsonserialization) より訳

変換することができるかを調べるメソッドとして`class func isValidJSONObject(_ obj: Any) -> Bool`があります。

## Data → JSONオブジェクト

URLSessionのレスポンスなどの結果をJSONオブジェクトに変換します。変換には

```swift
class func jsonObject(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> Any
```
を用います。引数としてNSDataとオプションを渡します。デシリアライズに失敗した時は例外が発生しcatchしたerrorにその理由が含まれます。またオプションには以下の物があります。

| JSONSerialization.ReadingOptions | 説明 |
|-----|----|
| mutableContainers | 利用するオブジェクトをNSMutableArray, NSMutabileDictionaryで変換します |
| mutableLeaves| オブジェクトのキーとしてNSMutableStringを用います|
| allowFragments | JSONのトップレベルオブジェクトとしてDictionary, Array以外を指定できます。( `"hoge"` のような文字列のみでも変換できます)|

**実行例**

以下の文字列についてパースを行います。

```swift
let jsonString = "{" +
"    \"employees\" : [" +
"        { \"lastName\" : \"Doe\", \"firstName\" : \"John\" }," +
"        { \"lastName\" : \"Smith\", \"firstName\" : \"Anna\" }," +
"        { \"lastName\" : \"Jones\", \"firstName\" : \"Peter\" }" +
"    ]" +
"}"
```

変換コード

```swift
let data = jsonString.data(using: String.Encoding.utf8)!
do {
    let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    print(object)
} catch let e {
    print(e)
}
```

出力結果

```
{
    employees =     (
                {
            firstName = John;
            lastName = Doe;
        },
                {
            firstName = Anna;
            lastName = Smith;
        },
                {
            firstName = Peter;
            lastName = Jones;
        }
    );
}
```

## JSONオブジェクト → Data

JSONオブジェクトからDataへの変換には

```swift
class func data(withJSONObject obj: Any, options opt: JSONSerialization.WritingOptions = []) throws -> Data
```

を用います。基本的な使い方は上記の逆となります。JSONのトップレベルオブジェクトを引数として渡します。同時にオプションとエラーへのポインタを渡します。変換に成功したらUTF-8でエンコードされた文字列のDataが返されます。エラーがあったときはerrorにその内容が含まれます。

上記データを逆にDataに変換したサンプルは以下のようになります。

変換コード

```swift
do {
    let data = try JSONSerialization.data(withJSONObject: object, options: [])
    let jsonString = String(data: data, encoding: String.Encoding.utf8)
    print(jsonString!)
} catch let e {
    print(e)
}
```

出力結果

```
{"employees":[{"firstName":"John","lastName":"Doe"},{"firstName":"Anna","lastName":"Smith"},{"firstName":"Peter","lastName":"Jones"}]}
```

またオプションとしてNSJSONWritingPrettyPrintedを渡すと改行やインデントを含めた文字列のDataがレスポンスになります。

```
{
  "employees" : [
    {
      "firstName" : "John",
      "lastName" : "Doe"
    },
    {
      "firstName" : "Anna",
      "lastName" : "Smith"
    },
    {
      "firstName" : "Peter",
      "lastName" : "Jones"
    }
  ]
}
```
