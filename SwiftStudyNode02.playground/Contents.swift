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





















