//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Extensions
// Extension Syntax

//extension SomeType {
//    
//}

//extension someType: SomeProtocal, AnotherProtocal {
//    
//}

// Computed Properties
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet os \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

// Initializers
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var orign = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(orign: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let orignX = center.x - (size.width / 2)
        let orignY = center.y - (size.height / 2)
        
        self.init(orign:Point(x: orignX, y: orignY),size:size);
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// Methods
extension Int {
    func repetitions(task: ()->Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions({ print("Hello!")})
3.repetitions({ print("Goodbye!")})

// Mutating Instance Methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

// Subscripts
extension Int {
    subscript(var digitIndex: Int)->Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        
        return (self / decimalBase)%10
    }
}

676767887[0]

// Nested Types
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x>0 :
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
            
        }
    }
    
    print("")
}

printIntegerKinds([3, 19, -27, 0 , -6, 0 ,7])

