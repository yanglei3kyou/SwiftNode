//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Functions
// Definings and Calling Functions
func sayHello(personName: String) ->String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("Anna"))
print(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}

print(sayHelloAgain("Anna"))

// Functions Without Parameters
func sayHelloWorld()->String {
    return "hello, world"
}

// Functions With Multiple Parameters
func sayHello(personName: String, alreadyGreeted: Bool)->String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}

print(sayHello("Tim", alreadyGreeted: true))

// Functions Without Return Values
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}

sayGoodbye("Dave")


func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}

func printWithoutCounting(stringToPrint: String) {
    print(stringToPrint)
}

printAndCount("hello, world")
printWithoutCounting("hello, world")

// Functions with Multiple Return Values And Optional Tuple Return Types
func minMax(array:[Int])->(min:Int,max:Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

if let bounds = minMax([8,-6,2,109,3,71]) {
    print("min is \(bounds.min) max is \(bounds.max)")
}

// Function Parameter Names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(1, secondParameterName: 2)

// Specifying External Parameter Names
func someFunction(externalParameterName localParameterName: Int) {
    
}

func sayHello(to person: String, and anotherPerson: String)->String {
    return "Hello \(person) and \(anotherPerson)！"
}

print(sayHello(to: "Bill", and: "Ted"))

// Ommitting External Parameter Names
func someFunction(firstParamterName: Int, _ secondParameterName: Int) {
    
}

someFunction(2, 1)

// Default Parameter Values
func someFunction(parameterWithDefault: Int = 12) {
    
}

someFunction(6)
someFunction()

// Variadic Parameter 
func arithmetiMean(numbers:Double...)->Double {
    var total: Double = 0
    for value in numbers {
        total += value
    }
    return total/Double(numbers.count)
}

arithmetiMean(1,2,2,3,4,5)
arithmetiMean(3,8.25,18.75)

//Constant and Variable Paramters
func alignRight(var string:String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    
    return string
}

let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
print(originalString)

// In-Out Parameters
func swapTwoInts(inout a: Int,inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt now is \(someInt) another now is \(anotherInt)")

// Function Types
func addTwoInts(a:Int, _ b:Int)->Int {
    return a+b
}

func multiplyTwoInts(a: Int, _ b: Int)->Int {
    return a*b
}

func printHelloWorld() {
    print("hello world")
}

// Using Function Types
var mathFunction:(Int,Int)->Int = addTwoInts
print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2,3))")

let anotherMathFunction = addTwoInts

// Function Types as Paramter Types
func printMathResult(mathFunctionIn:(Int,Int)->Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunctionIn(a,b))")
}

printMathResult(addTwoInts, 3, 5)

// Function Types as Return Types
func stepForward(input: Int)->Int {
    return input+1
}

func stepBackward(input: Int)->Int {
    return input-1
}

func chooseStepFunction(backwards: Bool)->(Int)->Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
var moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to Zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// Nested Functions
func chooseStepFunctionSecond(backwards:Bool)->(Int)->Int {
    func stepForward(input: Int)->Int {
        return input+1
    }
    func stepBackward(input: Int)->Int {
        return input-1
    }
    
    return backwards ? stepBackward : stepForward
}

currentValue = -4
moveNearerToZero = chooseStepFunction(currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero")


