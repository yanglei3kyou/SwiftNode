//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Enumerations
enum SomeEnumeration {
    
}

enum CompassPoint: String {
    case North
    case South
    case East
    case West
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Urans, Neptune
}

var directionToHead = CompassPoint.West

directionToHead = .East

// Matching Enumeration Values with a Switch Statement
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// Associated Values
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem)\(manufacturer)\(product)\(check)")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem)\(manufacturer)\(product)\(check)")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}

// Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// Implicitly Assignedn Raw Values
let earthsOrder = Planet.Earth.rawValue
let sunsetDirection = CompassPoint.West.rawValue

// Initializing from a Raw Value
let possiblePlanet = Planet(rawValue: 7)

let positionToFind = 9
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }

} else {
    print(" There isn't a planet at position \(positionToFind)")
}

// Recursive Enumerations
//enum ArithmeticExpression {
//    case Number(Int)
//    indirect case Addtion(ArithmeticExpression,ArithmeticExpression)
//    indirect case Multilication(ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case Number(Int)
    case Addtion(ArithmeticExpression,ArithmeticExpression)
    case Multilication(ArithmeticExpression,ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression)->Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addtion(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multilication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addtion(five, four)
let product = ArithmeticExpression.Multilication(sum, ArithmeticExpression.Number(2))

print(evaluate(product))
