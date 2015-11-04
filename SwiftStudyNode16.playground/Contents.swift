//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Methods
// Instance Methods

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.incrementBy(5)
counter.count
counter.reset()
counter.count

// Local And External Parameter Names for Methods
class CounterAnother {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += (amount * numberOfTimes)
    }
    
    func increment() {
        self.count++
    }
}

let counterAnother = CounterAnother()
counterAnother.incrementBy(5, numberOfTimes: 3)

// The self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double)->Bool {
        return self.x > x
    }
    
//    mutating func moveByX(deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point(x: x+deltaX, y: y+deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}

somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Assigning to self Within a Mutating Method
enum TriStateSwitch {
    case Off,Low,High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

// Type Methods 
class someClass {
    class func someTypeMethod() {
        
    }
}
someClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int)->Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    mutating func advanceToLevel(level: Int)->Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel  = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completeLevel(level: Int) {
        LevelTracker.unlockLevel(level+1)
        tracker.advanceToLevel(level+1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completeLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}







