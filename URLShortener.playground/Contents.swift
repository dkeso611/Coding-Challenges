import UIKit

func getRandomID(length: Int) -> Int {
    var uniqueID: Int
    var range = 1
    
    for _ in 0..<length {
        range *= 10
    }
    
    range -= 1
    uniqueID = Int.random(in: 0...range)
    print(uniqueID)
    return uniqueID
    
}




func shortenURL(uniqueID: Int) -> String {
    let characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let base = characterSet.count
    var uniqueID = uniqueID
    var shortURL = ""

    while uniqueID > 0 {
        let newCharacter =  characterSet[characterSet.index(characterSet.startIndex, offsetBy: uniqueID % base)]
        shortURL.append(newCharacter)
        uniqueID = uniqueID / base
        
        }
    
    shortURL = String(shortURL.reversed())

    print(shortURL)
    return shortURL
}


func decode(string: String) -> Int {
    let characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let base = characterSet.count
    var uniqueID = 0
    
    for i in 0..<string.count {
        let letterToFind = string[string.index(string.startIndex, offsetBy: i)]
        uniqueID = uniqueID * base + (characterSet.firstIndex(of: letterToFind)?.encodedOffset)!
    }
    
    print(uniqueID)
    return uniqueID
}
var uniqueID = getRandomID(length: 8)
var shortURL = shortenURL(uniqueID: uniqueID)
var decodedID = decode(string: shortURL)

if uniqueID == decodedID {
    print(true)
}


