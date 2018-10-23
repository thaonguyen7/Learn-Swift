//function
func greet(person: String, day: String) -> String {
    return "Hello \(person), toda is \(day)"
}
greet(person: "Bob", day: "Tuesday")

//argument name
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), to day is \(day)"
}
greet("John", on: "Wednesday")

//tuple
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//function return function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//function as argument
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//closure
numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}
//omit parameter type & return type
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//refer to parameters by number, closure appear immediately after the parentheses
let sortedNumbers1 = numbers.sorted() { $0 > $1 }
print(sortedNumbers1)
//omit the parantheses
let sortedNumbers2 = numbers.sorted { $0 > $1 }
print(sortedNumbers2)
