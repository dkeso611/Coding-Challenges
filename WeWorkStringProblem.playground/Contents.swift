import UIKit

func compareString(string1: String, string2: String) {
    var indexA: Int?
    var indexB: Int?
    var index2A: Int?
    var index2B: Int?
    var aCounter = 0
    var bCounter = 0
    
    for (index1, char1) in string1.enumerated() {
        for (index2, char2) in string2.enumerated(){
            if char1 == "a" && char2 == "a" {
                if index1 > index2 {
                    print("a moved left")
                } else if index1 < index2 {
                    print("a moved right")
                } else {
                    print("a no movement")
                }
                
                indexA = index1
                index2A = index2
            }
            
            if char1 == "b" && char2 == "b" {
                if index1 > index2 {
                    print("b moved left")
                } else if index1 < index2 {
                    print("b moved right")
                } else {
                    print("b no movement")
                }
                
                indexB = index1
                index2B = index2
            }
            
            //Only a's  move left
            if char1 == char2 && char1 != "a" {
                if index1 > index2 {
//                    print("others moved left")
                    aCounter += 1
                }
            }
            
            //Only b's  move right
            if char1 == char2 && char1 != "b"  {
                if index1 < index2 {
//                    print("others moved right")
                    bCounter += 1
                }
            }

        }
    }
    
    print(aCounter)
    
    if aCounter == 0 {
        print("only a's moved left")
    }
    
    if bCounter == 0 {
        print("only b's moved right")
    }
    
    if indexB! > indexA! && index2B! > index2A! {
        print("a always before b")
    }
    
    if indexB! < indexA! && index2B! < index2A! || indexB! > indexA! && index2B! > index2A! {
        print("never crossed")
    }
    
    if indexB! > indexA! && index2B! < index2A! || indexB! < indexA! && index2B! > index2A! {
        print("crossed")
    }
    
    
    
//    let abDistance = indexB! - indexA!
//    let ab2Distance = index2B! - index2A!
//    let difference = abs(ab2Distance - abDistance)
//    if difference > 1 {
//        print("crossed")
//    }

}




compareString(string1: "bcdae", string2: "cbade")
