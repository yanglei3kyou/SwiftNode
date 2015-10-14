//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Control Flow
/*
    complex 复杂的
    clause 分句
    inclusive 全包括的
    semicolon 分号
    interval 间隔
    tuple 元组
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

// Conditional Statements
// If
var temperatureInFahrenheit = 30
if  temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm.Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm.Don't forget to wear sunscreen.")
}

// Switch
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "a","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//Not Implicit Fallthrough
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
    fallthrough
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")

// Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the orign")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0,\(somePoint.1)) is on the y-axis")
case (-2...2, -2...2) :
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axix with a y value of \(y)")
case let (x, y):
    print("somewhere else at \(x),\(y)")
}

