var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}

var evenSum = 0
for i in evens {
    evenSum += i
}

print(evenSum)

evenSum = Array(1...10)
    .filter { (number) in number % 2 == 0}
    .reduce(0) { (total, number) in total + number}

print(evenSum)

var result = Array(1...10).reduce(0) { (maximum, number) in
    return max(maximum, number)
}

print(result)

let numbers = Array(1...10)
    .reduce("numbers: ") {(total, number) in total + "\(number) "}
print(numbers)

// Challenge: See if you can use reduce to take an array of digits and convert them into an integer. Given the input array:
let digits = ["3", "1", "4", "1"]
let integer = digits.reduce(0) { (number, digit) in
    return number * 10 + (Int(digit) ?? 0)
}
print(integer)

extension Array {
    func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
        var current = seed
        for item in self {
            current = combiner(current, item as! T)
        }
        return current
    }
    
    func reduce1<T>(initValue: T, combiner: (T, Element) -> T) -> T {
        var current = initValue
        for item in self {
            current = combiner(current, item)
        }
        return current
    }
}

let k = digits.myReduce(seed: 0) { (number, digit) in
    return number * 10 + (Int(digit) ?? 0)
}

let i = digits.reduce1(initValue: 0) { (total, digit) -> Int in
    return total + (Int(digit) ?? 0)
}
