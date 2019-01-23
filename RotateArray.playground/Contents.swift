import UIKit

//Given an array, rotate the array to the right by k steps, where k is non-negative.

func rightRotateArray(array: [Int], k: Int) {
    var rotatedArray = [Int]()
    
    for i in (k...k + array.count - 1).reversed() {
        rotatedArray.append(array[array.count - 1 - i % array.count])
    }
    
    print(rotatedArray)
}

func leftRotateArray(array:[Int], k: Int) {
    var rotatedArray = [Int]()
    
    for i in (k...k + array.count - 1) {
        rotatedArray.append(array[i % array.count])
    }
    
    print(rotatedArray)
}

class RotateArrayClassic {
    
    class func rotate(_ array: inout [Int], _ k: Int) {
        var k = k % array.count
        reverse(array: &array, start: 0, end: array.count - 1)
        reverse(array: &array, start: 0, end: k - 1)
        reverse(array: &array, start: k, end: array.count - 1)
        
        
        print(array)
    }
    
    
    
    private class func reverse(array: inout [Int], start: Int, end: Int) {
        var l = start
        var r =  end
        
        while l < r {
            
            array.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
    
}

var array = [1,2,3,4,5,6,7]

var k = 1
var new = array + array
print((array + array)[k..<k + array.count])
print(new[(array.count - k)..<array.count + array.count - k])



rightRotateArray(array: array, k: 3)
//leftRotateArray(array: array, k: 2)
//RotateArrayClassic.rotate(&array, 2)

