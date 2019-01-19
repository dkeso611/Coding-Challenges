import UIKit

//Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

func majorityElement(array: [Int]) -> Any? {
    //    var array = array
    var dictionary: [Int: Int] = [:]
    var maxCount = array.count / 2
    var maxElement: Int!
    
    for (_, num) in array.enumerated() {
        
        if (dictionary[num] == nil) {
            dictionary[num] = 1
        } else {
            dictionary[num] = dictionary[num]! + 1
            
            if dictionary[num]! > maxCount {
                maxCount = dictionary[num]!
                maxElement = num
            }
        }
    }
    
    print(maxElement)
    return maxElement
}


var array = [3,2,3,2]
var array2 = [2,2,1,1,1,2,2]
var array3 = [1,1,1,2,2,3]

majorityElement(array: array3)
