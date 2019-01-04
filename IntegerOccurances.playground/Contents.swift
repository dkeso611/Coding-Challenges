import UIKit

//Binary Search O(n log n)
func getIntegerCount(array: [Int], target: Int) -> Int {
    var count: Int = 0
    var lowIndex = 0
    var highIndex = array.count - 1
    
    
    while lowIndex <= highIndex {
        let half = (lowIndex + highIndex)/2
        
        if target == array[half] {
            
            for i in (0...half).reversed() {
                if array[i] == target {
                    count += 1
                } else {
                    break
                }
            }
            
            for i in (half + 1)..<array.count {
                if array[i] == target {
                    count += 1
                } else {
                    break
                }
            }
            
            return count
            
        } else if target < array[half] {
            highIndex = half - 1
        } else {
            lowIndex = half + 1
        }
    }
    
    return count
    
}

//Brute-Force O(n)
func getIntegerCountBF(array: [Int], target: Int) -> Int {
    var count = 0
    
    for num in array {
        if num == target {
            count += 1
        }
    }
    
    return count
}


 print(getIntegerCount(array: [1, 2, 3, 3, 3, 8], target: 3))

 print(getIntegerCountBF(array: [1, 2, 3, 3, 3, 8], target: 3))
