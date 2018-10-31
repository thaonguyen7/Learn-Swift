// declare a protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// adopt protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 99999
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

enum SimpleEnum: String, ExampleProtocol {
    case No
    case Yes
    
    var simpleDescription: String {
        return "A simple enum, value = \(self)"
    }
    
    mutating func adjust() {
        if self == .No {
            self = .Yes
        } else {
            self = .No
        }
    }
}
var c = SimpleEnum.No
c.simpleDescription
c.adjust()
c.simpleDescription

// extension: *** add methods and computed properties *** to an existing type
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self *= 10
    }
}

var number1 = 7
number1.simpleDescription
number1.adjust()
number1.simpleDescription

// dynamic type linking
var protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
protocolValue = b
protocolValue.simpleDescription
protocolValue = c
protocolValue.simpleDescription
