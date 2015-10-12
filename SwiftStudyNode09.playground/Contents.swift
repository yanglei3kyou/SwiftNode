//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Collection Types
/*
    shorthand 速记，简写
    syntax 句法，语法，写法
    compatible 合适的
*/
let testArray = [1,2,3,4]

// Creating an Empty Array
var someInts = [Int]()
var someIntsByOtherWay = Array<Int>()
print("someIints is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

// Creating an Array with a Default Value
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]

// Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

// Iterating Over an Array
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1):\(value)")
}


