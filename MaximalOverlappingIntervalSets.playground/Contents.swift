import UIKit

func maxOverlappingSet( array1: [Int], array2:  [Int]) {
    var time = 0
    var i = 0
    var j = 0
    var guests = 0
    var maxGuests = 0
    var arrival = array1.sorted()
    var exit = array2.sorted()
    var exitTime = 0
 
    
    while i < arrival.count && j < exit.count {
        if arrival[i] < exit[j] {
            guests += 1
            
            if guests > maxGuests {
                maxGuests = guests
                time = arrival[i]
                exitTime = exit[i]
                
                print("max:", maxGuests)
                print("time:", time)
            }
            
            i += 1
            
        } else if arrival[i] > exit[j] {
            if guests > 0 {
                guests -= 1
            }
            
            j += 1
            
        } else {
            i += 1
            j += 1
        }
        
        print("guests:", guests)
        
    }
    
    print("time:", time, "max:", maxGuests)
    print("exit time:", exitTime)
}


maxOverlappingSet(array1: [5, 5, 7, 4, 10], array2: [6, 9, 8, 5, 11])
