//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Type Casting
// Defining a Class Hierarchy for Type Casting
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Moive: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let lirary = [
    Moive(name: "Casablance", director: "Michael Curtize"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Moive(name: "Citizen Kane", director: "Orson Wells"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

// Checking Type
var movieCount = 0
var songCount = 0

for item in lirary {
    if item is Moive {
        movieCount++
    } else if item is Song {
        songCount++
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

// Downcasting
for item in lirary {
    if let movie = item as? Moive {
        print("Moive: \(movie.name) , dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

// Type Casting for Any and AnyObject
// AnyObject
let someObjects: [AnyObject] = [
    Moive(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Moive(name: "Moon", director: "Duncan Jones"),
    Moive(name: "Alien", director: "Ridley Scott")
]

for objet in someObjects {
    let moive = objet as! Moive
    print("Moive: \(moive.name), dir \(moive.director)")
}

for moive in someObjects as! [Moive] {
    print("Moive: \(moive.name), dir \(moive.director)")
}

// Any 
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(43)
things.append(3.1415)
things.append("hello")
things.append((3.0,5.0))
things.append(Moive(name: "DDD", director: "DDD"))
things.append({(name: String)->String in "Hello, \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("Zero as an Int")
    case 0 as Double:
        print("Zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("A positive Double value of \(someDouble)")
    case is Double:
        print("Some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x,y) as (Double,Double):
        print("an (x,y) point at \(x)\(y)")
    case let movie as Moive:
        print("a movie called \(movie.name) dir.\(movie.director)")
    case let stringConverter as String->String:
        print(stringConverter("dddd"))
    default:
        print("Something else")
    }
}

