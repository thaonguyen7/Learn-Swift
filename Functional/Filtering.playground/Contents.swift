
var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}

func isEvent(number: Int) -> Bool {
    return number % 2 == 0
}

evens = Array(1...10).filter(isEvent)

evens = Array(1...10).filter({ (number) -> Bool in
    return number % 2 == 0
})

evens = Array(1...10).filter({ (number) in
    return number % 2 == 0
})

evens = Array(1...10).filter { (number) in
    return number % 2 == 0
}

evens = Array(1...10).filter { $0 % 2 == 0 }

func myFilter<T>(source: [T], predicate: (T) -> Bool) -> [T] {
    var result = [T]()
    for item in source {
        if predicate(item) {
            result.append(item)
        }
    }
    return result
}

evens = myFilter(source: Array(1...10), predicate: { (number) -> Bool in
    return number % 2 == 0
})

evens = myFilter(source: Array(1...10)) { $0 % 2 == 0 }

extension Array {
    func myFilter(predicate: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        for item in self {
            if predicate(item) {
                result.append(item)
            }
        }
        return result
    }

    func filter1<T>(condition: (T) -> Bool) -> [T] {
        var result = [T]()
        for item in self {
            if condition(item as! T) {
                result.append(item as! T)
            }
        }
        return result
    }
}

evens = Array(1...10).myFilter { $0 % 2 == 0 }

evens = Array(1...10).filter1(condition: { (number) -> Bool in
    number % 2 == 1
})

print(evens)
