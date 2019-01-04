import UIKit

func compareString(string1: String, string2: String) {
    var indexA: Int?
    var indexB: Int?
    var index2A: Int?
    var index2B: Int?
    
    for (index1, char1) in string1.enumerated() {
        for (index2, char2) in string2.enumerated(){
//           print(index2, char2)
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
            
            if char1 == "a" && char2 == "b" {
//                print(index1, index2)
                if index1 < index2 {
                    print("a before b")
                } else if index1 > index2 {
                    print("b before a")
                }
            }
            

        }
    }
    

    if indexB! > indexA! && index2B! < index2A! || indexB! < indexA! && index2B! > index2A! {
        print("crossed")
    }
    
    let abDistance = indexB! - indexA!
    let ab2Distance = index2B! - index2A!
    let difference = abs(ab2Distance - abDistance)
    if difference > 1 {
        print("crossed")
    }

}




compareString(string1: "acb", string2: "cba")
