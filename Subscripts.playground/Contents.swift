import Foundation

@dynamicMemberLookup
struct Checkerboard {
    enum Square: String {
        case empty = "▪️"
        case red = "🔴"
        case white = "⚪️"
    }
    
    typealias Coordinate = (x: Int, y: Int)
    
    private var squares: [[Square]] = [
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .red,   .empty, .red,   .empty, .red,   .empty, .red,   .empty ],
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ],
        [ .empty, .white, .empty, .white, .empty, .white, .empty, .white ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ]
    ]
    
    /*
    func piece(at coordinate: Coordinate) -> Square {
        return squares[coordinate.y][coordinate.x]
    }
    
    mutating func setPiece(at coordinate: Coordinate, to newValue: Square) {
        squares[coordinate.y][coordinate.x] = newValue
    }
    */
    subscript(coordinate: Coordinate) -> Square {
        get {
            return squares[coordinate.y][coordinate.x]
        }
        set {
            squares[coordinate.y][coordinate.x] = newValue
        }
    }
    
    subscript(x: Int, y: Int) -> Square {
        get {
            return self[(x: x, y: y)]
        }
        set {
            self[(x: x, y: y)] = newValue
        }
    }
    
    private func convert(string: String) -> Coordinate {
        let expression = try! NSRegularExpression(pattern: "[xy](\\d+)")
        let matches = expression
            .matches(in: string,
                     options: [],
                     range: NSRange(string.startIndex..., in: string))
        let xy = matches.map { String(string[Range($0.range(at: 1), in: string)!]) }
        let x = Int(xy[0])!
        let y = Int(xy[1])!
        return (x: x, y: y)
    }
    
    subscript(input: String) -> Square {
        get {
            let coordinate = convert(string: input)
            return self[coordinate]
        }
        set {
            let coordinate = convert(string: input)
            self[coordinate] = newValue
        }
    }
    
    subscript(dynamicMember input: String) -> Square {
        get {
            let coordinate = convert(string: input)
            return self[coordinate]
        }
        set {
            let coordinate = convert(string: input)
            self[coordinate] = newValue
        }
    }
}

extension Checkerboard: CustomStringConvertible {
    var description: String {
        return squares.map { row in row.map { $0.rawValue }.joined(separator: "") }
            .joined(separator: "\n") + "\n"
    }
}

var checkerboard = Checkerboard()
print(checkerboard)

let coordinate = (x: 3, y: 2)
print(checkerboard[coordinate])
checkerboard[coordinate] = .white
print(checkerboard)

print(checkerboard[1, 2])
checkerboard[1, 2] = .white
print(checkerboard)

print(checkerboard.x6y7)
checkerboard.x6y7 = .red
print(checkerboard)
