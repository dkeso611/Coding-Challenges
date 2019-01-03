import UIKit

func firstUniqueCharacter(string: String) -> Int {
    var characterDict: [Character: Bool] = [:]
    
    for char in string {
        if characterDict[char] != nil {
            characterDict[char] = true
        } else {
            characterDict[char] = false
        }
    }
    
    for (i, char) in string.enumerated() {
        if characterDict[char] == false {
            return i
        }
    }
    
    return -1
        
}

var string = "leetcodel"
firstUniqueCharacter(string: string)
