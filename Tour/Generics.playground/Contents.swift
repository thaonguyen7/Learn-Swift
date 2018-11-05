// generic function
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// generic enum
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped) // tuple
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
let (value1) = possibleInteger

switch possibleInteger {
case .none:
    print("None")
case let .some(value):
    print(value)
}
let (value2) = OptionalValue<Int>.some(200)

// where
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
anyCommonElements(["a", "b", "c"], ["d"])
//anyCommonElements(["a", "b", "c"], [3]) compile error
