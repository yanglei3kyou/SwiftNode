//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Enumerations and Structures 枚举值、结构体
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription()->String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func biggerThanAnotherValue(waitValue: Rank)->Bool {
        return self.rawValue > waitValue.rawValue
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
ace.simpleDescription()

let jack = Rank.Jack
let queen = Rank.Queen
let king = Rank.King

queen.biggerThanAnotherValue(jack)
queen.biggerThanAnotherValue(king)

// Use the init?(rawValue:) initializer 用行值来初始化枚举值
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// Another didn't have any meaning Enumerations
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription()->String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color()->String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
    
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// Struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription()->String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case Half(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let half = ServerResponse.Half("We should eat launch")
let failure = ServerResponse.Error("Out of cheese")

switch half {
case let .Result(sunrise, sunset):
    let serverResponese = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure ...\(error)"
case let .Half(half):
    let serverResponse = "Half \(half)"
}




