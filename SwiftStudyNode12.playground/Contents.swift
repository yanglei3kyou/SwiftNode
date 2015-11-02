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


