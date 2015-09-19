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
