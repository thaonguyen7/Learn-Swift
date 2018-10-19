import Foundation

let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
    var result = [Entry]()
    
    var letters = [Character]()
    
    for word in words {
        let firstLetter = Character(String(word[word.startIndex]).uppercased())
        if !letters.contains(firstLetter) {
            letters.append(firstLetter)
        }
    }
    
    for letter in letters {
        var wordsForLetter = [String]()
        
        for word in words {
             let firstLetter = Character(String(word[word.startIndex]).uppercased())
            
            if firstLetter == letter {
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    
    return result
}

print(buildIndex(words: words))
