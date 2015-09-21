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


// Question Yanglei about enumeration init -- solved
enum SimpleEnumeration: ExampleProtocol {
    case Base, Adjusted
    var simpleDescription:String {
        get {
            return self.getDescription()
        }
    }
    
    func getDescription()->String {
        switch self {
        case .Base:
            return "A simple description of enum"
        case .Adjusted:
            return "Adjusted description of enum"
//        default:
//            return "Default description"
        }
    }
    
    mutating func adjust() {
        self = SimpleEnumeration.Adjusted
    }
}

var c:SimpleEnumeration = SimpleEnumeration.Base
c.adjust()
c.simpleDescription

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

// Generics 泛型
func repeatItem<Item>(item: Item, numberOfTimes: Int)->[Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

repeatItem("knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements<T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U)->Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1,2,3], [3])

func anyCommonElementsIn<T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U)-> Array<T.Generator.Element> {
    var result = Array<T.Generator.Element>()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                result.append(lhsItem)
            }
        }
    }
    return result
}
anyCommonElementsIn([1,2,3], [2,3])





