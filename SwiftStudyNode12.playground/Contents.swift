//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Closures
// The Sort Method
let names = ["Chris", "Ales", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String)->Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

// Closure Expression Syntax
reversed = names.sort({
    (s1: String, s2: String)->Bool in
    return s1>s2
})

reversed = names.sort({(s1: String, s2: String)->Bool in return s1>s2 })

// Inferring Type From Context
reversed = names.sort({s1,s2 in return s1<s2})

// Implicit Returns from Single-Expression Closures
reversed = names.sort({s1,s2 in s1>s2})

// Shorthand Argument Names
reversed = names.sort({$0 > $1})

// Operator Functions
reversed = names.sort(>)

// Trailing Closures
func someFunctionThatTakesAClosure(closure:()->Void) {
    
}

someFunctionThatTakesAClosure({
    
})

someFunctionThatTakesAClosure() {
    
}

reversed = names.sort() {$0>$1}

reversed = names.sort {$0 > $1}

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five",
    6: "Six", 7:"Seven", 8:"Eight", 9:"Night"];
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number)->String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

print(strings)

// Capturing Values
func makeIncrementer(forIncrement amount: Int)->()->Int {
    var runingTotal = 0
    func incrementer()->Int {
        runingTotal += amount
        return runingTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()

incrementByTen()

// Closures Are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let nextCustomer = {
    customersInLine.removeAtIndex(0)
}

print(customersInLine.count)
print("Now serving \(nextCustomer())")
print(customersInLine.count)

func serveNextCustomer(customer:()->String){
    print("Now serving \(customer())!")
}

serveNextCustomer({
    customersInLine.removeAtIndex(0)
})

func serveNextCustomer(@autoclosure curtomer:()->String) {
    print("Now serving \(curtomer())!")
}

serveNextCustomer(customersInLine.removeAtIndex(0))

var customerClosures: [()->String] = []
func collectCustomerClosures(@autoclosure(escaping) customer:()->String) {
    customerClosures.append(customer)
}

collectCustomerClosures(customersInLine.removeAtIndex(0))
collectCustomerClosures(customersInLine.removeAtIndex(0))

print("Collected \(customerClosures.count) closures.")
for customerClosure in customerClosures {
    print("Now serving \(customerClosure())!")
}







