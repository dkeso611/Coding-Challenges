import UIKit

func numberOfBoomerangs(points: [[Int]]) {
    

    var num = 0
    
    for i in 0..<points.count {
        var dictionary: [Int: Int] = [:]

        for j in 0..<points.count {
//            print(points[i][j])

            if i == j {
                continue
            }

            let distance = ((points[j][0] - points[i][0]) * (points[j][0] - points[i][0])) + ((points[j][1] - points[i][1]) * (points[j][1] - points[i][1]))
//
//    for (i, point) in points.enumerated() {
//        var dictionary: [Int: Int] = [:]
//        for (j, anotherpoint) in points.enumerated() {
//            if i == j {
//                continue
//            }
//
//            let distance = (anotherpoint[0] - point[0]) * (anotherpoint[0] - point[0])  + (anotherpoint[1] - point[1]) * (anotherpoint[1] - point[1])
            print(distance)

            if let sameDistancePoints = dictionary[distance] {
                dictionary[distance] = sameDistancePoints + 1
            } else {
                dictionary[distance] = 1
            }
        }

        for key in dictionary.keys {
            print(key)
            num += dictionary[key]! * (dictionary[key]! - 1)
        }
    }
    
    print(num)
    
    
//    for (i, point) in points.enumerated() {
//        var dict = [Int: Int]()
//        for (j, anotherpoint) in points.enumerated() {
//            if i == j {
//                continue
//            }
//
//            let distance = (anotherpoint[0] - point[0]) * (anotherpoint[0] - point[0])  + (anotherpoint[1] - point[1]) * (anotherpoint[1] - point[1])
//            print(distance)
//            if let sameDistancePoints = dict[distance] {
//                dict[distance] = sameDistancePoints + 1
//            } else {
//                dict[distance] = 1
//            }
//        }
//
//        for key in dict.keys {
//            num += dict[key]! * (dict[key]! - 1)
//        }
//    }
//
////    print(num)
}

var points = [[0,0],[1,0],[2,0]]
numberOfBoomerangs(points: points)
