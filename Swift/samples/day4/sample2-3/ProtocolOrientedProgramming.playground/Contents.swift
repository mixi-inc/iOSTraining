//: Playground - noun: a place where people can play

import UIKit

//MARK: - Protocol
protocol Runnable {
    var runnningSpeed: Int { get set }
    func run()
}

extension Runnable {
    func run() {
        print("\(String(describing: self)) runnning speed: \(runnningSpeed)km/h")
    }
}

protocol Swimmable {
    var swimmingSpeed: Int { get set }
    func swim()
}

extension Swimmable {
    func swim() {
        print("\(String(describing: self)) swimming speed: \(swimmingSpeed)km/h")
    }
}

protocol Flyable {
    var flyingSpeed: Int { get set }
    func fly()
}

extension Flyable {
    func fly() {
        print("\(String(describing: self)) flying speed: \(flyingSpeed)km/h")
    }
}

//MARK: - Aniaml
class Animal {
    
}

//MARK: - Mammalian
class Mammalian: Animal {
    
}

class Lion: Mammalian, Runnable {
    var runnningSpeed: Int = 58
}

class Whale: Mammalian, Swimmable {
    var swimmingSpeed: Int = 36
}

//MARK: - Birds
class Birds: Animal {
    
}

class Eagle: Birds, Flyable {
    var flyingSpeed: Int = 160
}

class Chicken: Birds, Runnable {
    var runnningSpeed: Int = 6
}

class Penguin: Birds, Runnable, Swimmable {
    var runnningSpeed: Int = 9
    var swimmingSpeed: Int = 36
}

//MARK: - Fish
class Fish: Animal {
    
}

class Tuna: Fish, Swimmable {
    var swimmingSpeed: Int = 80
}

class Flyingfish: Fish, Swimmable, Flyable {
    var swimmingSpeed: Int = 35
    var flyingSpeed: Int = 70
}

//MARK: - Generics Sample
func swimmableAnimal<T: Animal>(_ animal: T) where T: Swimmable {
    animal.swim()
}

func swimmableFish<T: Fish>(_ fish: T) where T: Swimmable {
    fish.swim()
}

//MARK: - Sample
let flyingFish = Flyingfish()
flyingFish.swim()
flyingFish.fly()

let penguin = Penguin()
penguin.run()
penguin.swim()

swimmableAnimal(flyingFish)
swimmableAnimal(penguin)
//swimmableFish(penguin) //error
swimmableFish(flyingFish)
