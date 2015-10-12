//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Strings and Characters
/*
    syntax 句法
    manipulation 控制
    mutability 可控性
    interpolation 插入语句，插入
    concatenate 串联，联系
    instruction 教导，指令
    tab -> tabulator 跳格键
    sparkle 闪亮，闪光
    grapheme 字形
    clustes 组，使聚集
    scalar 纯量
    graphically 以图形方式表达
    script 脚本
    alphabet 字母表
    retrieve 取回，检索
    modify 修改
    access 存取，访问
    consecutive 连续的
    canonically 标准的
    linguistic 语言的
    conversely 相反的
    chunk 大块
    compliant 顺从的，合适的
*/

// String Literals
let someString = "Some string literal value"

// Initializing an Empty String
var emptyString = ""
var antherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
} else {
    print("Did have something")
}

// String Mutability
var variableString = "Horse"
variableString += " and carriage"

// constant string cannot be modified
//let constantString = "Highlander"
//constantString += " and another Highlander"

// Working with Characters
for character in "Dog!🐶".characters {
    print(character)
}

// The right sentence lenght must be 1
let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)

// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"

var welcome = string1 + string2

var instruction = "look over"
instruction += string2

// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Special Characters in String Literals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"


let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorForUA: Character = "\u{1F1FA}\u{1F1E6}"
let regionalIndicatorForCN: Character = "\u{1F1E8}\u{1F1F3}"
let regionalIndicatorForUK: Character = "\u{1F1EC}\u{1F1E7}"
/*
\u{1F1E6} A
\u{1F1E7} B
\u{1F1E8} C
\u{1F1E9} D
\u{1F1EA} E
\u{1F1EB} F
\u{1F1EC} G
\u{1F1ED} H
\u{1F1EE} I
\u{1F1EF} J
\u{1F1F0} K
\u{1F1F1} L
\u{1F1F2} M
\u{1F1F3} N
\u{1F1F4} O
\u{1F1F5} P
\u{1F1F6} Q
\u{1F1F7} R
\u{1F1F8} S
\u{1F1F9} T
\u{1F1FA} U
\u{1F1FB} V
\u{1F1FC} W
\u{1F1FD} X
\u{1F1FE} W
\u{1F1FF} Z
*/

// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐫"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word  = "cofe"
print("the number of characters in \(word) is \(word.characters.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

/*
    The count of the characters returned by the characters property is not always the same as the length property of an NSString that contains the same characters.
*/

// Accessing and Modifying a String
// String Indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]

let index = greeting.startIndex.advancedBy(7)
greeting[index]

// The code belove is Error
//greeting[greeting.endIndex]
//greeting.endIndex.successor()

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator:"")
}

// Inserting and Removing
var welcome128 = "hello"
welcome128.insert("!", atIndex: welcome128.endIndex)

welcome128.insertContentsOf(" there".characters, at: welcome128.endIndex.predecessor())

welcome128.removeAtIndex(welcome128.endIndex.predecessor())

let range = welcome128.endIndex.advancedBy(-6)..<welcome128.endIndex
welcome128.removeRange(range)

// Comparing Strings
// String and Characters Equality
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Volez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Volez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

// Prefix and Suffix Equality
let remoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in remoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in remoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// Unicode Representations of Strings
let dogString = "Dog!!🐶"

// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator:"");
}

print("")

// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator:"")
}

print("")

// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator:"")
}

print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}



