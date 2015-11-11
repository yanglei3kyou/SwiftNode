//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Optinoal Chaining
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

var john = Person()
let roomCount = john.residence?.numberOfRooms

if roomCount != nil {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()
if let roomCountEx = john.residence?.numberOfRooms {
    print("John's residence has \(roomCountEx) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

// Defining Model Classes for Optional Chaining
class PersonEx {
    var residence: ResidenceEx?
}

class ResidenceEx {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int)->Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }

    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}


class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier()->String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber)\(street)"
        } else {
            return nil
        }
    }
}

// Accessing Properties Through Optional Chaining
let johnEx = PersonEx()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
johnEx.residence?.address = someAddress

// Calling Methods Through Optional Chaining
if johnEx.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (johnEx.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

// Accessing Subscripts Through Optional Chaining
if let firstRoomName = johnEx.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

johnEx.residence?[0] = Room(name: "Bathroom")
let johnsHouse = ResidenceEx()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
johnEx.residence = johnsHouse

if let firstRoomName = johnEx.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

// Accessing Subscripts of Optional Type
var testScores = ["Dave":[86,82,84],"Bev":[79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72

// Linking Multiple Levels of Chaining
if let johnsStreet = johnEx.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
johnEx.residence?.address = johnsAddress

if let johnsStreet = johnEx.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

// Chaining on Methods with Optional Return Values
if let buildingIdentifier = johnEx.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = johnEx.residence?.address?.buildingIdentifier()?.hasPrefix("ddd") {
    if beginsWithThe {
        print("John's building identifier begins with \"the\"")
    } else {
        print("John;s building identifier does not begin with \"the\"")
    }
}

