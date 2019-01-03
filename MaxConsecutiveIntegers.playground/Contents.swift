import UIKit

func maxConsecutiveOnes(array: [Int]) {
    var globalMax = 0
    var localMax = 0
    
    for nums in array {
        if nums == 1 {
           localMax += 1
            if localMax > globalMax {
                globalMax = localMax
            }
            
        } else {
            //resets if next integer is not 1
            localMax = 0
        }
    }
    
    print(globalMax)
}

var array = [1,1,0,1,1,1]

maxConsecutiveOnes(array: array)
