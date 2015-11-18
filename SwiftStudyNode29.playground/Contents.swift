//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Access Control
// Modules and Source Files
// Access Levels
/*
    Public
    Internal
    Private
*/

// Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

// Getters and Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "ddd"
stringToEdit.value = "ddd"
stringToEdit.value = "ddd"
print(stringToEdit.numberOfEdits)

