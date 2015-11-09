//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Initialization

// Initailizers
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature). Fahrenheit")

// Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

// Local and External Parameter Names
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGraf = Color(white: 0.5)
//let veryGreen = Color(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)

// Initializer Parameters Without External Names
let bodyTemperature = Celsius(37.0)

// Optional Property Types
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

// Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

// Initializer Delegation for Value Types
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var orign = Point()
    var size = Size()
    init(){}
    init(orign: Point, size: Size) {
        self.orign = orign
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let orignX = center.x - (size.width / 2)
        let orignY = center.y - (size.height / 2)
        self.init(orign: Point(x: orignX, y: orignY), size: size)
    }
}

let basicRect = Rect()
let orignRect = Rect(orign: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// Class Inheritance and Initialization
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

// Designated and Convenience Initalizers in Action
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let nameMeat = Food(name: "Bacon")
let mysterMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name:name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItemEx: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) * \(name)"
        output += purchased ? "√" : "×"
        return output
    }
}

var breakfastList = [
    ShoppingListItemEx(),
    ShoppingListItemEx(name: "Bacon"),
    ShoppingListItemEx(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// Failable Initialzers
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

// Failable Initializers for Enumerations
enum TemperatureUnit {
    case Kelvin, Celsius, Faherenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
            self = .Kelvin
            case "C":
            self = .Celsius
            case "F":
            self = .Faherenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil  {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "x")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Enumerations with Raw Values
enum TemperatureUnitEx: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnitEx = TemperatureUnitEx(rawValue: "F")
if fahrenheitUnitEx != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnitEx = TemperatureUnitEx(rawValue: "X")
if unknownUnitEx == nil {
    print("This is not a defined temperture unit, so initialization failed.")
}

// Failable Initializers for Classes
class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

if let bowTie = Product(name: "bow tie") {
    print("The product's name is \(bowTie.name)")
}

// Propagation of Initialization Failure
class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 {return nil}
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity:\(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

//Overriding a Failable Initializer
class Document {
    var name: String?
    init(){}
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument:Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// Required Initializers
class SomeClass {
    required init() {
        
    }
}

class SomeSubClass: SomeClass {
    required init() {
        
    }
}

// Setting a Default Property Value with a Closure or Function

class SomeClassEx {
    let someProperty: Int = {
        return 1
    }()
}

struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row:Int, colum: Int)->Bool {
        return boardColors[(row * 10) + colum]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(0, colum: 1))
print(board.squareIsBlackAtRow(9, colum: 9))










