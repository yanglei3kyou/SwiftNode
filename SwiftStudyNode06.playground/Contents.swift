//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Type Safety and Type Inference

/*
    deduce 推断
    literal 字面的
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

