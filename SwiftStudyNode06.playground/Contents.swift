//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Type Safety and Type Inference

/*
    deduce 推断
    literal 字面的
    exponent 指数
    decimal 小数
    underscores 下划线
    optimization 优化
*/

let meaningOfLife = 42

// if you don't specify a type for a  floating-point literal, Swift infers that you want to create a Double
// 默认推断的浮点型 为 Double
let pi = 3.14159

let anotherPi = 3 + 0.14159
// Int + Double -> Double

// Numeric Literals 进制
/*
    A decimal number, with no prefix            十进制
    A binary number, with a 0b prefix           二进制
    An octal number, with a 0o prefix           八进制
    A hexadecimal number, with a 0x prefix      十六进制
*/

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

/*
    1.25e2 means 1.25×10², or 125.0
*/
/*
    0xFp2 means 15×2²,or 60.0
*/

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0     //Int((12+3/16)*2^0)
let testHexadecimalDouble = (12+3/16.0)*1

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// Numeric Type Conversion
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

// 数字计算的时候必须类型必须统一
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
//let twoThousandAddOne = twoThousand + one     This is Error
let twoThousandAddOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let threeAddPi = Double(three) + pointOneFourOneFiveNine

// Float(Double)->Int or Intger must be shorted!
let integerPi = Int(pi)

// Type Aliases
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let i = 1
// Error
//if i {
//    
//}

if i == 1 {
    
}

// Tuples
let http404Error = (404,"Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCodeName: 200,descriptionName:"OK")
print("The status code is \(http200Status.statusCodeName)")
print("The status message is \(http200Status.descriptionName)")

// Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? =  404
serverResponseCode = nil

var surveyAnswer: String?
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber).")
}

// Optional Binding
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

// Implicitly Unwrapped Optionals
let possibleString: String? = "An optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

// Error Handing

func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
    
} catch {
    
}

func makeASandwich() throws {
    
}

// Assertions 断言
/*
    trigger 触发
    cause 原因，造成
    execution 执行，履行
    omit 忽视，删除
    potential 潜在，可能性
*/
let age = -3
//assert(age > 0, "A person's age connot be less than zero")















