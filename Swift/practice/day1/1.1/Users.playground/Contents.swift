//: Playground - noun: a place where people can play

enum Gender: Int {
    case man
    case female
}

class User {
    var name: String
    var gender: Gender
    var era: Int
    var age: Int
    var visits: [Int]
    
    init?(dict: [String : Any?]) {
        guard
            let name = dict["name"] as? String,
            let rawGender = dict["gender"] as? Int,
            let gender = Gender(rawValue: rawGender),
            let era = dict["era"] as? Int,
            let age = dict["age"] as? Int
            else { return nil }

        self.name = name
        self.gender = gender
        self.era = era
        self.age = age
        self.visits = dict["visits"] as? [Int] ?? []
    }
}

let dict: [String : [[String : Any?]]] = [
    "users": [
        [
            "name" : "Dr. Emmett Brown",
            "gender" : 1,
            "era" : 1985,
            "age" : 65,
            "visits": [
                1885, 1955, 1985, 2015
            ],
        ],
        [
            "name" : "Marty McFly",
            "gender" : 1,
            "era" : 1985,
            "age" : 17,
            "visits": [
                1885, 1955, 1985, 2015
            ],
        ],
        [
            "name" : "Lorraine Baines",
            "gender" : 0,
            "era" : 1955,
            "age" : 18,
            "visits": nil,
        ],
    ],
]


let users: [User] = (dict["users"] ?? []).flatMap{ User(dict: $0)}
print(users)
