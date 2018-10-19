import Foundation

let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
    func firstLetter(str: String) -> Character {
        return Character(String(str[str.startIndex]).uppercased())
    }
    
    let letters = words.map { (word) -> Character in
        firstLetter(str: word)
    }
    
    let distincLetters = distinct(source: letters)
    
    return distincLetters.map({ (letter) -> Entry in
        return (letter, words.filter({ (word) -> Bool in
            firstLetter(str: word) == letter
        }))
    })
}

func buildIndex2(words: [String]) -> [Entry] {
    func firstLetter(str: String) -> Character {
        return Character(String(str[str.startIndex]).uppercased())
    }
    
    return distinct(source: words.map(firstLetter)).map({ (letter) -> Entry in
        return (letter, words.filter({ (word) -> Bool in
            firstLetter(str: word) == letter
        }))
    })
}

func distinct<T: Equatable>(source: [T]) -> [T] {
    var unique = [T]()
    for item in source {
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}

print(buildIndex(words: words))
print(buildIndex2(words: words))
