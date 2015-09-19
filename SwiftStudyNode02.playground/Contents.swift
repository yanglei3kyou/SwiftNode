//: Playground - noun: a place where people can play

import UIKit

// The Swift Programming Language(Swift 2)
// Page 24 Objects and Classes
// 常量必须有初始值, 变量若没有初始值,用后面的 init
class Shape {
    var numberOfSides: Int = 0
    let sideLength: Int = 4
    func simpleDescription()->String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func calculateTheArea(numberOfArea: Int)->Int {
        return numberOfArea * sideLength
    }
    
}

var shape = Shape()
shape.numberOfSides = 4
shape.simpleDescription()

shape.calculateTheArea(4)

// Page 25  Class property init (必须包含初始值，除了懒加载，后面有介绍)
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("This Item is deinit")
    }
    
    func simpleDescription()->String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape01 = NamedShape(name: "Shape")
//var shape01 = NamedShape()
shape01.simpleDescription()


// Page 26 Class override 子类如果实现init方法，必须使用子类的init方法
class iosParent {
    var age: Int
    var name: String
    
    init(age:Int, name:String) {
        self.age = age
        self.name = name
    }
    
    func sayHello() {
        print("Parent Say Hello")
    }
    
    func greetString()->String {
        return "Hello I am a Father, My name is \(self.name), i am \(self.age) years old."
    }
}

class iosChildren: iosParent {
    var score: Float = 100.0
    
    init(score:Float) {
        super.init(age: 15, name:"Children")
        self.score = score
    }
    
    override func greetString()->String {
        return "Hello I am a children, My name is \(self.name), i am \(self.age) years old. In last test, i get the \(self.score) scores."
    }

}
var MingFather = iosParent(age: 40, name: "MingFather")
MingFather.sayHello()
MingFather.greetString()

var xiaoMing = iosChildren(score: 99.0)
xiaoMing.sayHello()
xiaoMing.greetString()

// 注意 父类的指针可以指向子类的实例，若子类重写父类的函数，父类指针调用的时候执行的是子类重写的方法，父类指针无法访问子类的属性
var errorChildren: iosParent = iosChildren(score: 98.0)
errorChildren.greetString()


// Page 28  Class Setter Getter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength:Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// willSet didSet
class Square:NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area()->Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return " A Square with sides of length \(sideLength)."
    }
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


// 可选值 若变量为nil 则返回值为nil ，若为有效值，则正常运算
//let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let optionalSquare: Square? = nil
let sideLength = optionalSquare?.sideLength
















