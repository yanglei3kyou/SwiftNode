//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Basic Operators
/*
    eliminate 排除
    assignment 任务，分配
    be decomposed into 分解
    feature 特征,特性,方面
    multiples 倍数
    strictly 严格地
    shortcut 捷径，快捷键
    coalesce 合并
    iterate 重复
*/

// Assignment Operator
let b = 10
var a = 5
a = b

let (x,y) = (1, 2)
x
y

//if x = y {
//    // this is not valid, because x = y does not return a value
//}

// Arithmetic Operators 算术操作符
/*
    Addition(+)
    Subtraction(-)
    Multiplication(*)
    Division(/)
*/

1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"

// Remainder Opertor 求余操作符
10 % 3
-10 % 3
-1 % 3
-1 % -3
1 % -3
1 % 3
9 % 4

/*
    notes:
        The sign of b is ignored for negetive values of b. This is means that a % b and a % -b always give the same answer.
*/

8 % 2.5


// Increment and Decrement Operators
var i = 0
var iFloat = 0.1
++i
++iFloat

var a92 = 0
let b92 = ++a92
let c92 = a92++

// Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix

// Compound Assignment Opertors
var a94 = 1
a94 += 2

// Comparsion Operators
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

// Ternary Conditional Operator
//let contentHeight = 40
//let hasHeader = true
//let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight
if hasHeader {
    rowHeight += 50
} else {
    rowHeight += 20
}

// Nil Coalescing Operator
let a100: Int? = 2
a100 != nil ? a100! : b

let defaultColorName = "red"
var userDefineColorName: String? = "green"
var colorNameToUse = userDefineColorName ?? defaultColorName

// Range Operators
// Closed Range Opertor
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}

// Logical Operators
// Logical NOT Operator
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// Logical AND Operator
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome !")
} else {
    print("Access DENIED")
}

// Logical OR Operator
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

// Combinding Logical Operators 左结合，优先级一致
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

if false && true || true && true {
    print("True")
} else {
    print("false")
}

// Explicit Parenetheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}




