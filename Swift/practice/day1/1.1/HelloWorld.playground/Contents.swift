//: Playground - noun: a place where people can play

let h: String? = "H"
let ell = "ell"
let o: String? = "o"
var world: String! = nil
world = " world!"


let helloWorld: String = (h ?? "H") + ell + (o ?? "o") + world
print(helloWorld)
