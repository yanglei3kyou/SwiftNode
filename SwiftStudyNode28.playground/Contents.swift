//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Generics
// The Problem That Generics Solve
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt now is \(someInt), anotherInt is \(anotherInt)")

func swapTwoStrings(inout a: String, inout _ b: String) {
    let tempA = a
    a = b
    b = tempA
}

func swapTwoDoubles(inout a: Double, inout _ b: Double) {
    let tempA = a
    a = b
    b = tempA
}

// Generic Functions
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let tempA = a
    a = b
    b = tempA
}

swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

// Type Parameters
// Naming Type Parameters
// Generic Types

struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop()->Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop()->Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}

// Type Constraints
// Type Constraints Syntax
// Type Constraints in Action
func findStringIndex(array:[String], _ valueToFind: String)->Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat","dog","llama","parakeet"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index is \(foundIndex)")
}

func findIndex<T: Equatable>(array:[T] , _ valueToFind: T)->Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let doubleIndex = findIndex([3.144,44.0], 44.0)

// Associated Types
// Associated Types in Action
protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int{get}
    subscript(i: Int)->ItemType{get}
}

struct StackEx<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop()->Element {
        return items.removeLast()
    }
    
    mutating func append(item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int)->Element {
        return items[i]
    }
}

// Where Clauses
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, _ anotherContainer: C2)->Bool {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfStringsEx = StackEx<String>()
stackOfStringsEx.push("uno")
stackOfStringsEx.push("dos")
stackOfStringsEx.push("tres")
stackOfStringsEx.push("cuatro")

var arrayOfStrings = ["uno","dos","tres"]

//if allItemsMatch(stackOfStringsEx, arrayOfStrings) {
//    print("All Items match")
//} else {
//    print("Not all Items match")
//}

