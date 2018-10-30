// simple class
class Shape {
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    deinit {
        //nothing
    }
}

let shape = Shape()
shape.numberOfSides = 3
var shapeDescription = shape.simpleDescription()

// class with initializer
class NamedShape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A \(name) with \(numberOfSides) sides"
    }
    
    deinit {
        //nothing
    }
}

let triangle = NamedShape(name: "Triangle")
triangle.numberOfSides = 3
shapeDescription = triangle.simpleDescription()

// subclass
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 50, name: "A test squre")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}
let circle = Circle(radius: 30, name: "A test circle")
circle.area()
circle.simpleDescription()

// computed property
class EquilateralTriangle: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        
        //Setting the value of properties that the subclass declares.
        self.sideLength = sideLength
        
        //Calling the superclass’s initializer.
        super.init(name: name)
        
        //Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
        numberOfSides = 3
    }
    
    override func simpleDescription() -> String {
        return "A Equilateral triangle with sides of length \(sideLength)"
    }
    
    var perimeter: Double {
        get {
            return sideLength * 3
        }
        
        set {
            sideLength = newValue / 3
        }
    }
    
    var perimeter2: Double {
        get {
            return sideLength * 3
        }
        
        set (argumentName) { // explicit name for newValue
            sideLength = argumentName / 3
        }
    }
}
var triangle2 = EquilateralTriangle(sideLength: 3.1, name: "A triangle")
print(triangle2.perimeter)
triangle2.perimeter = 9.9
print(triangle2.sideLength)

// property change observer
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
        triangle = EquilateralTriangle(sideLength: size, name: name)
        square = Square(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.triangle.sideLength)
print(triangleAndSquare.square.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)
print(triangleAndSquare.square.sideLength)

// optional value expression
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
