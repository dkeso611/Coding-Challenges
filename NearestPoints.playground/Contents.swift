import UIKit

//n
func nearestPoints(target: [Int], pointsArray: [[Int]], k: Int) {
    var distance: Int
    var distanceArray: [Int] = []
    var distanceDict: [Int: [Int]] = [:]
    for point in pointsArray {
        print(point[0], point[1])
        distance = (point[0] - target[0]) * (point[0] - target[0]) + (point[1] - target[1] * point[1] - target[1])
//        print(distance)
        distanceArray.append(distance)
        distanceDict[distance] = point
    }
    
//    ‎O(n log n)
    distanceArray.sort()
//    print(distanceArray)
//    print(distanceDict)
    
    for i in 0..<k {
      print(distanceDict[distanceArray[i]]!)
    }
}



var points = [[4,0],
              [6, 2],
              [3, 8]]

nearestPoints(target: [1, 0], pointsArray: points, k: 2)
