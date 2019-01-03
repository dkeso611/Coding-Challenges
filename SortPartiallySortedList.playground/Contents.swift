import UIKit

//Use insertion sort or min heap

func insertionSortPartial(array: [Int]) {
    var sortedArray = array
    
    for i in 1..<sortedArray.count {
        var y = i
        
        let  hold = sortedArray[y]
        
        while y > 0 && hold < sortedArray[y - 1] {
            sortedArray[y] = sortedArray[y - 1]
            y -= 1
        }
        sortedArray[y] = hold
         print("less: \(hold) \(sortedArray)")
        
    }
    
    print(sortedArray)
}


var array = [6, 5, 3, 2, 8, 10, 9]
insertionSortPartial(array: array)

func minHeapSort(array: [String]) {
    
}
