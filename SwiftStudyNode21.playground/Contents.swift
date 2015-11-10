//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Automatic Reference Counting
/*
    snippet 片段
    tenant 租客
    garbage 垃圾
    scenario 剧情，场景
    interdependency 相互依存
    cope 应对、对付
    essence 本质
*/
// ARC in Action
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(self.name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// Strong Reference Cycles Between Class Instances
class PersonEx {
    let name: String
    init(name: String) {self.name = name}
    weak var apartment: ApartmentEx?
    deinit { print("\(name) is being deinitialized")}
}

class ApartmentEx {
    let unit: String
    init(unit: String) {self.unit = unit}
    var tenant: PersonEx?
    deinit {print("Apartment \(unit) is being deinitialized")}
}

var john: PersonEx?
var unit4A: ApartmentEx?

john = PersonEx(name: "Jorn Appleseed")
unit4A = ApartmentEx(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// Unowned References
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {print("\(name) is being deinitialized")}
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {print("Card #\(number) is being deinitialized")}
}

var johnEx: Customer?
johnEx = Customer(name: "John Appleseed")
johnEx!.card = CreditCard(number: 1234_5678, customer: johnEx!)

johnEx = nil

// Unowned References and Implicitly Unwrapped Optional Properties
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name:capitalName,country:self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country:Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

// Strong Reference Cycles for Closures
class HTMLElement{
    let name: String
    let text: String?
    init(name: String, text:String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
    lazy var asHTML: Void->String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil
