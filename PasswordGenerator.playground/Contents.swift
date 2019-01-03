import UIKit

func generatePassword(length: Int) -> String {
    var password = ""
    let characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    
    for _ in 0..<length {
        let randomNumber = Int.random(in: 0..<characterSet.count)
        let randomCharacter = characterSet[characterSet.index(characterSet.startIndex, offsetBy: randomNumber)]
        password.append(randomCharacter)
//        password += "\(randomCharacter)"
        
    }
    return password
}

print(generatePassword(length: 10))
