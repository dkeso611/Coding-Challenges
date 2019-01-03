import UIKit
import XCTest

func twoSum (array: [Int], target: Int) -> [Int] {
    var result: [Int] = []
    var complement: Int
    
    for i in array {
        complement = target - i
//        print("complement: \(complement)")
        if let complementIndex =  array.firstIndex(of: complement), let indexI = array.firstIndex(of: i) {
            if complement != i {
                result.append(complementIndex)
                result.append(indexI)
                return result
            }
        }
        
    }
    
    return result
    
}

func tooSum(array: [Int], target: Int) -> [Int]{
    var result: [Int] = []
    var complement: Int
    var dict = [Int: Int]()
    var index = 0
    
    for i in array {
        complement = target - i
//        print(i, complement)
        if let complementIndex = dict[complement] {
            result.append(complementIndex)
            result.append(index)
            return result
        } else {
//            print(dict)
            dict[i] = index
            index += 1
        }
    }

    return result
}

func toSum(array: [Int], target:Int) -> [Int] {
    var complement: Int
    var dict = [Int: Int]()
    
    for i in 0..<array.count {
        complement = target - array[i]
        if let complementIndex = dict[complement] {
//            print(i, complementIndex)
            return [complementIndex, i]
        }
        
        dict[array[i]] = i
//        print(dict)
        
    }
    
    return []
}

func toSumTuple(array: [Int], target:Int) -> (Int, Int)? {
    var complement: Int
    var dict = [Int: Int]()
    
    for index in 0..<array.count {
        complement = target - array[index]
        //if complement is in dictionary, return current index and complement index
        if let complementIndex = dict[complement] {
            return (complementIndex, index)
        }
        //If complement not in dictionary, save to dictionary as element: index
        dict[array[index]] = index
    }
    
    return .none
}

class Sum2 {
    func toSum(array: [Int], target:Int) -> [Int] {
        var complement: Int
        var dict = [Int: Int]()
        
        for i in 0..<array.count {
            complement = target - array[i]
            if let complementIndex = dict[complement] {
                //            print(i, complementIndex)
                return [complementIndex, i]
            }
            
            dict[array[i]] = i
            //        print(dict)
            
        }
        
        return []
    }
    
}




var array = [2, 6, 3, 4, 9]

twoSum(array: array, target: 15)
print(twoSum(array: array, target: 15))
print(tooSum(array: array, target: 15))
print(toSum(array: array, target: 15))
print(toSumTuple(array: array, target: 6))



//class test: XCTestCase{
//    func testSum() {
//        var mySum = Sum2()
//        var result = mySum.toSum(array: array, target: 15)
//        XCTAssertEqual(result, [1,4])
//        
//        
//    }
//    
//    
//}
//
//var testy = test()
//testy.testSum()

