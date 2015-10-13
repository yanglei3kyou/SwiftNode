//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Control Flow
/*
    complex 复杂的
    clause 分句
    inclusive 全包括的
    semicolon 分号
*/
// For Loops
// For-In
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 10
var answer = 1

for _ in 1...10 {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// For
var index: Int
for index = 0; index < 3; ++index {
    print("index is \(index)")
}
index

// While Loops
// While
let finalSquare: Int = 25
var board = [Int](count: 25 + 1, repeatedValue: 0)
board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

//var square: Int = 0
//var diceRoll: Int = 0
//while square < finalSquare {
//    square = Int(arc4random()%6)
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}
//
//print("Game over!")


