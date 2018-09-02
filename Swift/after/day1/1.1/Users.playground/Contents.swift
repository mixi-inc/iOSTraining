//: Playground - noun: a place where people can play

enum Gender: Int {
    case man
    case female
}

class User: CustomStringConvertible {
    let name: String
    let gender: Gender
    let era: Int
    let age: Int
    let visits: [Int]?
    
    // 参考実装
    /*
     * CustomStringConvertibleを適用せさdescriptionを実装すると
     * print時に実装したdescriptionが出力されます。
     */
    var description: String {
        return """
        \nUser:
        \tname   = \(name)
        \tera    = \(era)
        \tage    = \(age)
        \tvisits = \(String(describing: visits))\n
        """
    }
    
    init?(dict: [String : Any?]) {
        guard
            let name = dict["name"] as? String,
            let rawGender = dict["gender"] as? Int,
            let gender = Gender(rawValue: rawGender),
            let era = dict["era"] as? Int,
            let age = dict["age"] as? Int
        else {
            return nil
        }
        self.name = name
        self.gender = gender
        self.era = era
        self.age = age
        self.visits = dict["visits"] as? [Int]
    }
}

let dict: [String : [[String : Any?]]] = [
    "users" : [
        [
            "name" : "Dr. Emmett Brown",
            "gender" : 1,
            "era" : 1985,
            "age" : 65,
            "visits" : [
                1885, 1955, 1985, 2015
            ]
        ],
        [
            "name" : "Marty McFly",
            "gender" : 1,
            "era" : 1985,
            "age" : 17,
            "visits" : [
                1885, 1955, 1985, 2015
            ]
        ],
        [
            "name" : "Lorraine Baines",
            "gender" : 1,
            "era" : 1955,
            "age" : 18,
            "visits" : nil
        ]
    ]
]

//usersのarrayを取得し、flatMapを使ってUser型に変換
let users: [User] = (dict["users"] ?? []).compactMap { User(dict: $0) }
print(users)
