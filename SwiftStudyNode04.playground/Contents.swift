//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Protocols and Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjust."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


// Question Yanglei about enumeration init
//
//enum SimpleEnumeration: ExampleProtocol {
//    case Ace
//    var simpleDescription:String {
//        get {
//            return self.simpleDescription
//        }
//        set {
//            self.simpleDescription = newValue
//        }
//    }
//    
//    mutating func adjust() {
//        simpleDescription += " enumeration (adjusted)"
//    }
//}
//
//var c:SimpleEnumeration = SimpleEnumeration.Ace
//c.adjust()
//c.simpleDescription

// extension
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

protocol absoluteValuePro {
    mutating func absoluteValue()->Double
}

extension Double: absoluteValuePro {
    func absoluteValue()->Double {
        if self > 0 {
            return self
        } else {
            return -self
        }
        
    }
}

print((-3.14).absoluteValue())

let protocalValue: ExampleProtocol = a
print(protocalValue.simpleDescription)



