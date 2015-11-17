//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Protocols
// Protocol Syntax
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    //    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "")+name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

// Method Requirements
protocol RandomNumberGenerator {
    func random()->Double
}

class LinerCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139967.0
    let a = 11.0
    let c = 34353.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c) % m
        return lastRandom / m
    }
}

let generator = LinerCongruentialGenerator()
print(generator.random())
print(generator.random())

// Mutating Method Requiremenets
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off,On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
            
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// Protocols as Types
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll()->Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinerCongruentialGenerator())
for _ in 1...5 {
    print(d6.roll())
}

// Delegation
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStar(game: DiceGame)
    func game(game: DiceGame, didStarNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinerCongruentialGenerator())
    
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStar(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStarNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStar(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Stared a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)- sided dice")
    }
    
    func game(game: DiceGame, didStarNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()

game.delegate = tracker
game.play()

// Adding Protocol Conformance with an Extension
protocol TextRepresentable {
    var textualDescription: String {get}
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sides dice"
    }
}

let d12 = Dice(sides: 12, generator: LinerCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snake and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)

// Declaring Protocol Adoption with an Extension
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

// Collections of Protocol Types
let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

// Protocol Inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "dd"
            case let snake where snake < 0:
                output += "B"
            default:
                output += "o"
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

// Protocol Composition
protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct PersonEx: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named,Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let birthdayPerson = PersonEx(name: "Malcoln", age: 21)
wishHappyBirthday(birthdayPerson)

// Checking for Protocol Conformance
protocol HasArea {
    var area: Double {get}
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {return pi*radius*radius}
    init(radius: Double) {self.radius = radius}
}

class Country: HasArea {
    var area: Double
    init(area: Double){self.area = area}
}

class Animal {
    var legs: Int
    init(legs: Int){self.legs = legs}
}

let objects:[AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// Optional Protocol Requirements
//protocol CounterDataSource {
//    optional func incrementForCount(count:Int)->Int
//    optional var fixedIncrement: Int {get}
//}
//
//class Counter {
//    var count = 0
//    var dataSource: CounterDataSource?
//    func increment() {
//        if let amount = dataSource?.incrementForCount(count) {
//            count += amount
//        } else if let amount = dataSource?.fixedIncrement {
//            count += amount
//        }
//    }
//}
