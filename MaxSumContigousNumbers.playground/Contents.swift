import UIKit


func maxSumContigous(array: [Int]) {
    var max = 0
    var globalMax = 0
    var subarray = [Int]()
    var maxStart = 0
    var maxEnd = 0
    
    for (i, num) in array.enumerated() {
        
        max += num
        if max < 0 {
            max = 0
            maxStart = i + 1 //update max start until max is greater than 1
        }
        
        if max > globalMax {
            globalMax = max
            maxEnd = i
        }
        
    }
    
    for i in maxStart...maxEnd {
        subarray.append(array[i])
    }
    
    let count = subarray.count
    
    print("max:", globalMax)
    print("startIndex:", maxStart)
    print("endIndex:", maxEnd)
    print("subarray:", subarray)
    print("count:", count)
    
}

func negativeMaxSumContigous(array: [Int]) {
    var max = array[0]
    var globalMax = array[0]
    var subarray = [Int]()
    var maxStart = 0
    var maxEnd = 0
    
    for (i, num) in array.enumerated() {
        if i == 0 {
            continue
        }
        
        //max is sum of previous elements + current element
        //if max is greater than current element, skip and check if its greater than global max.if so, set global max to max
        //if all positive integers, subarray is the entire array
        
        //if max(sum of previous elements + current element) is less than current element, means that one of the integers are negative
        //let max = num, and if max is positive, maxStart = i, skip to max/gloabal max check.
        //if all negative integers, the largest integer is the max sum
        max += num
        
        if max < num {
            max = num
            if max > 0 {
                maxStart = i
            }
        }
        
        if max > globalMax {
            globalMax = max
            maxEnd = i
            
            if globalMax < 0 {
                maxStart = i
            }
            
        }
    }
    
    for i in maxStart...maxEnd {
        subarray.append(array[i])
    }
    
    let count = subarray.count
    
    print("max:", globalMax)
    print("startIndex:", maxStart)
    print("endIndex:", maxEnd)
    print("subarray:", subarray)
    print("count:", count)
    
}


var array = [-4, -2, -3, 0]
var array2 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
var array3 = [3, -5, 1, 4]
var negativeArray = [-2, -1, -3, -4, -1, -2, -1, -5, -4]

//findSumConsecutiveNumbers(array: array)
//sumOfConsecutiveNumbers(array: array2)
//negativeMaxSumContigous(array: array2)
negativeMaxSumContigous(array: array2)
