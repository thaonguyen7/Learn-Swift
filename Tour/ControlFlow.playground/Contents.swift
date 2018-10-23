// for loop
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// for each
individualScores.forEach { (number) in
    print(number)
}

// enumerated
for (index, value) in individualScores.enumerated() {
    print("Value at index \(index) is \(value)")
}

// if else
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    //nothing
}

// ?? operator
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

// switch case
let vegatable = "red pepper"
switch vegatable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
    fallthrough
default:
    print("Everything tastes good in soup.")
}

// for in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kindOfLargest = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfLargest = kind
        }
    }
}
print("Largest is \(largest), in kind of \(kindOfLargest)")

// while
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// repeat while
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// ..< operator
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// ... operator
var total2 = 0
for i in 0...4 {
    total2 += i
}
print(total2)
