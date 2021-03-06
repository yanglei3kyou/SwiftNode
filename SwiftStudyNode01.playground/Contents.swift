//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language (Swift 2)
// Page 5
print("Hello, world!")

// Page 6
let constValue: Int
constValue = 1

var varValue = 1
varValue = 2

// Page 7
let experiment7Value: Float = 4


let label7 = "The width is "
let width7 = 94
let widthLabel7 = label7 + String(width7)


// Page 8
let ageValue8 = 90
let ageAnther8 = 100
let greetString8 = "Hello, I am \(ageAnther8 - ageValue8) years old"


// Page 9
var shoppingList = ["dog","fish","Chicken"]
shoppingList[0] = "Big dog"
shoppingList.count
shoppingList.append("Small Cat")
shoppingList.count
print(shoppingList)


var occupations: Dictionary = [
    "key1":"value1",
    "key2":"value2",
]

occupations["key13"] = "d"
print(occupations)

var emptyArray = [String]()
var emptyDictionary = [String: Int]()

emptyDictionary["First"] = 9
emptyDictionary

emptyArray.append("First")
emptyArray = []
occupations = [:]

emptyArray.append("String")
emptyDictionary["SSS"] = 4
emptyDictionary

// Page 10 
// 此处的()可以省略,但是 {}不能省略(注:此处与Objective-C不同)
let individualScores = [100,42,33,50,12]
var teamScore = 0
for score in individualScores {
    if score >= 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

// Page 11
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
//var optionalName: String? = nil

// 可选值的使用方式
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello \(name)!"
} else {
    greeting = "Hello EveryBody!"
}

// Page 12
// Switch 对类型不做限制 fallthrough 穿透 (注:此处默认每个case 自带 break,与Objective-C不同) 必须有个default
let vegetabel = "red pepper"
switch vegetabel {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber","watercress":
        print("That would make a good teasandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy\(x)?")
    default:
        print("Everything tastes good in soup")
}

// Page 13
let interestingNumber = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]

// Page 14
var largest = 0
var kindString: String = ""
for (kind, numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
            kindString = kind
        }
    }
}
print("The largest number is \(largest), The kind is \(kindString)")

// Page 15  while(){}   repeat{}while()
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


// Page 16 ..< 不包括右侧  ...包括右侧
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop);

var secondForLoop = 0
for var i = 0; i < 4; i++ {
    secondForLoop += i
}
print(secondForLoop)


var thirdForLoop = 0
for i in 0...4 {
    thirdForLoop += i
}
print(thirdForLoop)


// Page 17
func greet(name: String, day: String)->String {
    return "Hello \(name), today is \(day)"
}
greet("Peter", day: "Sunday")

func greet(name: String, lunch: String)->String {
    return "Hello \(name), today wo eat \(lunch)"
}
greet("Peter", lunch: "Chicken")


// Page 18
func calculateStatistics(scores:[Int])->(min:Int, max:Int, sum:Int) {
    var minV = scores[0]
    var maxV = scores[0]
    var sumV = 0
    
    for score in scores {
        if score > maxV {
            maxV = score
        } else if score < minV {
            minV = score
        }
        sumV += score
    }
    
    return (minV,maxV,sumV)
    
}

let statistics = calculateStatistics([5,3,100,3,9])
print(statistics.sum)
print(statistics.2)

// Page 19
func sumOf(numbers:Int...)->(sum:Int, average: Double) {
    var sum = 0
    var average = 1.0
    for number in numbers {
        sum += number
    }
    
    if numbers.count == 0 {
        average = 0
    } else  {
        average = Double(average)/Double(numbers.count)
    }
    
    return (sum,average)
}

sumOf()
sumOf(42,597,12)

// Page 20 函数可以嵌套 
func returnFifteen()->Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()


func makeIncrementer()->(Int -> Int) {
    func addOne(number:Int)->Int {
        return number+1
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)


// Page 21 函数也可以作为一个参数使用
func hasAnyMatches(list:[Int], condition:Int->Bool)->Bool {
    for item in list {
        if lessThanTen(item) {
            return true;
        }
    }
    return false;
}

func lessThanTen(number:Int)->Bool {
    return number < 10
}

var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)

// Page 22 闭包 closure
numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}

numbers.map { (number: Int) -> Int in
    var result = 0
    if number%2 != 0 {
        result = number
    }
    return result
}

numbers.map { number in
    number * 3
}

numbers.map {
    $0 * 3
}

numbers.sort{
    $0 < $1
}



































