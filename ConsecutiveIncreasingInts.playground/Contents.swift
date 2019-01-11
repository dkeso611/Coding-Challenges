import UIKit

//While loop
func consecutiveIncreasingIntsWhile(array: [Int]) {
    var maxStart = 0
    var maxEnd = 0
    var start = 0
    var end = 0
    var length = 0
    var subarrayIndices = [[Int]]()
    var longestSubarray = [Int]()
    

    var i = 0
    while i < array.count {
        if i + 1 < array.count && array[i + 1] > array[i] {
            end += 1
            if end - start  > length {
                length = end - start + 1
                maxStart = start
                maxEnd = end
            }
        } else {
            subarrayIndices.append([start, end])
            start = i + 1
            end = i + 1
        }
        
        i += 1
    }
    
    for i in maxStart...maxEnd {
        longestSubarray.append(array[i])
    }

    print("longest subarray:", longestSubarray)
}

//For loop
func consectutiveIncreasingIntsFor(array: [Int]) {
    var start = 0
    var end = 0
    var maxStart = 0
    var maxEnd = 0
    var maxLength = 0
    var longestSubarray = [Int]()
    var subarrayIndices = [[Int]]()

    
    for (y, num) in array.enumerated() {
        if y + 1 < array.count  && array[y + 1] > array[y] {
            end += 1 //increase length by 1 if above conditons hold true
            if end - start + 1 > maxLength { //compare new length to maxLength (end - start + 1, if new length is greater, set new maxlength, start and end
                maxLength = end - start + 1
                maxEnd = end
                maxStart = start
            }
        } else {
            subarrayIndices.append([start, end]) //save all subarrays until this point
            //when conditons are false set end and start as next index
            end = y + 1
            start = y + 1
        }
    }

    longestSubarray.append(contentsOf: array[maxStart...maxEnd])
    
    print("max start:", maxStart, "max end:", maxEnd)
    print("longest subarray:", longestSubarray)
    print("subarray indices:", subarrayIndices)
    
}

var array = [1,2,3,0,2,3,5,6,7,1,4,5,6,9]
consecutiveIncreasingIntsWhile(array: array)
consectutiveIncreasingIntsFor(array: array)
