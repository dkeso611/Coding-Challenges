import UIKit

/*Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 For example, given [1,2,3,4], return [24,12,8,6].
 */

func arrayProduct(array: [Int]) -> [Int] {
    var productArray: [Int] = []
    productArray = Array(repeating: 1, count: array.count)
    
    
//    With Division
//    while counter < array.count {
//        product *= array[counter]
//        counter += 1
//        productArray.append(product)
//    }
//    print(product)
//    productArray = Array(repeating: product, count: array.count)
//
//    for i in 0..<productArray.count {
//        productArray[i] = productArray[i] / array[i]
//
//    }
    
    var leftProduct = 1
    for index in 0..<array.count {
        productArray[index] *= leftProduct
        leftProduct *= array[index]
//        print(index)
    }
    
    var rightProduct = 1
    for index in stride(from: array.count - 1, through: 0, by: -1) {
        productArray[index] *= rightProduct
        rightProduct *= array[index]
//        print(index)
    }

    return productArray
}

arrayProduct(array: [1, 2, 3, 4])
