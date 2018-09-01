//: Playground - noun: a place where people can play

let h: String? = "H"
let ell = "ell"
let o: String? = "o"
var world: String! = nil
world = " world!"


//模範解答1
let helloWorld: String
/*
 * var world: String!はImplicitlyUnwrappedOptionalなので
 * optional bindingをしなくても、この場合は値が入っているので
 * 値をそのまま使うことができるが、値が入っていない場合にクラッシュするので
 * optional bindingを行っておく。
 */
if let h2 = h, let o2 = o, let world2 = world {
    helloWorld = h2 + ell + o2 + world2
} else {
    helloWorld = ""
}
print(helloWorld)


//模範解答2
/*
 * [h, ell, o, world]は[String?]型なので
 * compactMapで[String]型に変換し、[String]型の
 * public func joined(separator: String = default) -> String
 * を使って内部のstringを結合する。
 * ※ループさせる回数が増える
 */
let helloWorld2: String = [h, ell, o, world].compactMap { $0 }.joined()
print(helloWorld2)


//模範解答3
/*
 * reduceを使って[String?]の中身を結合していく。
 * 結合するためには、Stringにしなければいけないので
 * optional bindingされた文字列をresultに結合して返す。
 */
let helloWorld3: String = [h, ell, o, world].reduce("") { result, value in
    guard let value = value else {
        return ""
    }
    return result + value
}
print(helloWorld3)
