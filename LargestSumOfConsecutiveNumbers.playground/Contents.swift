import UIKit

func findSumConsecutiveNumbers(array: [Int]) {
    var max = 0
    var globalMax = 0
    for i in 0..<array.count {
        if array[i] + max > max {
            max += array[i]
            if max > globalMax {
                globalMax = max
            }
        } else {
            max = 0
        }
    }
//    for num in array {
//        max += num
//
//        if max > globalMax {
//            globalMax = max
//        } else if max < 0  {
//            max = 0
//        }
//    }
    
    print(globalMax)
}

func sumOfConsecutiveNumbers(array: [Int]) {
    var max = 0
    var globalMax = 0
    var sequence = [Int]()
    var globalMaxIndices = [Int]()
    var maxIndex = 0
    
    for (i, num) in array.enumerated() {
        max += num
        
        if max < 0 {
            max = 0
        }
        
        if max > globalMax {
            globalMax = max
            globalMaxIndices.append(i)
            print(max)
        }
        

        

    }
    
    for i in globalMaxIndices.first!...globalMaxIndices.last! {
        sequence.append(array[i])
    }
    
    print(sequence)
    print(globalMax)
    globalMaxIndices
}


var array = [-2, -3, 4, -1, 1, 2, -6, -25, 15]

//findSumConsecutiveNumbers(array: array)
sumOfConsecutiveNumbers(array: array)
