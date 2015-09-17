//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language (Swift 2)
// Page 5
print("Hello, world!")

// Page 6
let constValue: Int
constValue = 1

var varValue = 1
varValue = 2

// Page 7
let experiment7Value: Float = 4


let label7 = "The width is "
let width7 = 94
let widthLabel7 = label7 + String(width7)


// Page 8
let ageValue8 = 90
let ageAnther8 = 100
let greetString8 = "Hello, I am \(ageAnther8 - ageValue8) years old"


// Page 9
var shoppingList = ["dog","fish","Chicken"]
shoppingList[0] = "Big dog"
shoppingList.count
shoppingList.append("Small Cat")
shoppingList.count
print(shoppingList)


var occupations: Dictionary = [
    "key1":"value1",
    "key2":"value2",
]

occupations["key13"] = "d"
print(occupations)

var emptyArray = [String]()
var emptyDictionary = [String: Int]()

emptyDictionary["First"] = 9
emptyDictionary

emptyArray.append("First")
emptyArray = []
occupations = [:]

emptyArray.append("String")
emptyDictionary["SSS"] = 4
emptyDictionary

// Page 10 
let individualScores = [100,42,33,50,12]
var teamScore = 0
for score in individualScores {
    if score >= 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)


















