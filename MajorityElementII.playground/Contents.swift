import UIKit

//Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

func majorityElements(array: [Int]) {
    var majorityArray: [Int] = []
    var dictionary: [Int: Int] = [:]
    let maxCount = array.count / 3
    
    for num in array {
        if dictionary[num] == nil {
            dictionary[num] = 1
        } else {
            dictionary[num] = dictionary[num]! + 1
            
            if dictionary[num]! > maxCount  {
            }
        }
    }
    
    for num in dictionary {
        if num.value > maxCount {
            majorityArray.append(num.key)
        }
    }
    
    print(majorityArray)
    
}

func majorityBooyerMoore(array: [Int]) {
    var num1 = 0
    var num2 = 0
    var count1 = 0
    var count2 = 0
    var majorityArray: [Int] = []
    
    for num in array {
        if num == num1 {
            count1 += 1
        } else if num == num2 {
            count2 += 1
        } else if count1 == 0 {
            num1 = num
            count1 += 1
        } else if count2 == 0 {
            num2 = num
            count2 += 1
        } else {
            count1 -= 1
            count2 -= 1
        }
        print(count1, count2)
    }
    
    count1 = 0
    count2 = 0
    
    for num in array {
        if num == num1 {
            count1 += 1
        }
        
        if num == num2 {
            count2 += 1
        }
    }
    
    if count1 > array.count/3 {
        majorityArray.append(num1)
    }
    
    if count2 > array.count/3 {
        majorityArray.append(num2)
    }
    print(majorityArray)
    
    
}

var array = [3,2,3,2]
var array2 = [2,2,1,1,1,2,2]
var array3 = [1,1,1,2,2,3]
var array4 = [1,1,1,1,3,3,2,3,2,2,2]

majorityElements(array: array4)
majorityBooyerMoore(array: array4)
