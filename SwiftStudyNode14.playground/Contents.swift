//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Classes and Structures
class SomeClass {
    
}

struct someStruct {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties
print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types
let vga = Resolution(width: 640, height: 480)

// Structures and Enumerations Are Value Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is now \(hd.width) pixels wide")

enum CompassPoint {
    case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remember direction is still .West")
}

// Classes Are Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEight = tenEighty
alsoTenEight.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators
if tenEighty === alsoTenEight {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}











