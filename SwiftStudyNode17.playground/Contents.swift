//: Playground - noun: a place where people can play

// The Swift Programming Language(Swift 2)
// Subscripts
// Subscript Syntax

class TestSubScriptClass {
    subscript(index: Int)->Int {
        get {
            return 1
        }
        set(newValue) {
            
        }
    }
}

let answer = TestSubScriptClass()
answer[1]

struct TimesTable {
    let multiplier: Int
    subscript(index: Int)->Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// Subscript Usage
var numberOfLegs = ["spider":8,"ant":6,"cat":4]
numberOfLegs["bird"] = 2


// Subscript Options
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsVaildForRow(row: Int, column: Int)->Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int)->Double {
        get {
            assert(indexIsVaildForRow(row, column: column), "Index out of range")
            return grid[(row*columns)+column]
        }
        set {
            assert(indexIsVaildForRow(row, column: column), "Index out of range")
            grid[(row*columns)+column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2

