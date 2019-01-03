import UIKit

func getCarrots(matrix: [[Int]]) -> Int? {
    
    return nil
}
var matrix = [[5, 7, 8, 6, 3],
              [0, 0, 7, 0, 4],
              [4, 6, 3, 4, 9],
              [3, 1, 0, 5, 8]]
print(matrix)

var new: [Int] = []
matrix.map{ new.append($0.max()!)}


var sum = 0

func spiral(matrix: [[Int]]) {
    var string = ""
    
//    guard matrix.count > 1 else {
//            print(matrix[0])
//            string += "\(matrix[0][0]) "
//            print(string)
//        return
//
//    }
    spiraled(matrix: matrix, string: &string)
    
    
//
//    for i in matrix[0] {
//        //    print(i)
//        string = string + "\(i) "
//    }
//
//    matrix =  Array(matrix[1...matrix.count - 1])
//    //print("trimmed: \(matrix)")
//
//    for i in matrix {
//        print(i)
//        var j = i
//        string += "\(i.last!) "
//        j.popLast()
//        matrix.remove(at: matrix.firstIndex(of: i)!)
//        matrix.append(j)
//        print(j)
//    }
//    var lastArrayReversed = matrix.last?.reversed()
//
//
//    for i in lastArrayReversed! {
//        print(i)
//        string += "\(i) "
//    }
//
//    matrix.popLast()
//
//    for i in matrix.reversed() {
//        var j = i
//        string += "\(i.first!) "
//        matrix.remove(at: matrix.firstIndex(of: i)!)
//        j.removeFirst()
//        matrix.append(j)
//
//    }
//
//    matrix = matrix.reversed()
//    print(matrix)
//    print(string)
//    spiral(matrix)
    
}

func spiraled(matrix: [[Int]], string: inout String) {
    var matrix = matrix
    guard matrix.count > 1 else {
        
//        if matrix.count != 0 {
//            string += "\(matrix[0][0]) "
//            print(matrix[0][0])
//            print("here")
//        } else {
//            print(matrix[0])
//            string += "\(matrix[0]) "
//            print("nah")
//        }
        
        if matrix == [[]] || matrix.count == 0 || matrix[0].count == 0 {
            print("nah")
            return
        } else if matrix.count == 1 {
            print("matirx count is 1")
            print(matrix[0][0])
            string += "\(matrix[0][0]) "
            print(string)
        }
        
        return
        
    }
    
    while matrix.count > 1 {
        //Prints first row
        for i in matrix[0] {
            print(i)
            string = string + "\(i) "
        }
        
        //trims first row from array
//        matrix = Array(matrix[1..<matrix.count])
        matrix.removeFirst()

        //prints last value of every, saves row as j, pop last, delete row from matrix then appends new row without last element to matrix
        for i in matrix {
//            print(i)
            var j = i
            string += "\(i.last!) "
            j.popLast()
//            j.removeLast()
            matrix.remove(at: matrix.firstIndex(of: i)!)
            print("removed \(matrix)")
            matrix.append(j)
        }
        
        
//        var lastArrayReversed = matrix.last?.reversed()
        //reverse last row and print
        print("reversing last row")
        for i in (matrix.last?.reversed())! {
            print(i)
            string += "\(i) "
        }
        
        //delete last row
        matrix.popLast()
        
        //to print bottom up, reverse the array, print first element of each row, save rows as j, remove first element in j, delete each row from matrix, append j to matrix
        print("printing bottom up")
        for i in matrix.reversed() {
            print(i)
            var j = i
            string += "\(i.first!) "
            matrix.remove(at: matrix.firstIndex(of: i)!)
            
            j.removeFirst()
            matrix.append(j)
            
        }
    
    //reverse matrix because j was appended in reverse
    matrix = matrix.reversed()
        print("matrix count: \(matrix.count)")
    print(string)
        print("last \(matrix)")
        if matrix.count > 0 {
            print("spiralled")
            spiraled(matrix: matrix, string: &string)
            
        }
    }
//    if matrix.count == 1 {
//        print(matrix[0])
//        string += "\(matrix[0][0]) "
//        print(string)
//    }
}

//spiral(matrix: matrix)
var mew = [[]]
//spiral(matrix: matrix )






//for i in matrix
//matrix.map{ new.append($0.min()!)}

//print(new.max()!)
//print(new.min()!)

//var midCol = matrix[0].count/2
//var midRow = matrix.count/2


//var floatRowCount = Float(exactly: matrix.count)
//var floatColCount = Float(exactly: matrix[0].count)
//
//var midRowCeil = ceilf(floatRowCount!/2)
//var midColCeil = ceilf(floatColCount!/2)
//
//var midRowFloor = floorf(floatRowCount!/2)
//var midColFloor = floorf(floatColCount!/2)

//
//func findArrayMid(matrix: [[Int]]) {
//    var floatRowCount = Float(exactly: matrix.count)
//    var floatColCount = Float(exactly: matrix[0].count)
//
//    var midRowCeil = ceilf(floatRowCount!/2)
//    var midColCeil = ceilf(floatColCount!/2)
//
//    var midRowFloor = floorf(floatRowCount!/2)
//    var midColFloor = floorf(floatColCount!/2)
//
////    if matrix[midRowCeil][midColCeil] > matrix[midRowFloor][midColFloor] {
//////        print
////    }
//
//}

func spiralOrder(matrix: [[Int]]) {
    var spiralArray: [Int] = []
    var spiralString = ""
    var testString = ""
    let n = matrix.count
    let m = matrix[0].count
    
    var left = 0
    var right = m - 1
    var top = 0
    var bottom = n - 1
    
    if matrix.count == 0 || matrix[0].count == 0 || matrix == [[]] {
        print(spiralArray)
        print(spiralString)

    }
    
    while spiralArray.count < n * m {
        
        //prints top array, going left to right
        for j in stride(from: left, through: right, by: 1) {
            spiralArray.append(matrix[top][j])
            spiralString += "\(matrix[top][j]) "
        }
        
        //increases top by one, therefore trimming matrix, matrix[0][j] -> matrix[1][j] next loop
        top += 1

        //prints right side of previously trimmed matrix, going top to bottom
        for j in stride(from: top, through: bottom, by: 1){
            spiralArray.append(matrix[j][right])
            spiralString += "\(matrix[j][right]) "
        }
        //decreases right by one, therefore trimming matrix, matrix[j][count - 1] -> matrix[j][count- 2] next loop
        right -= 1
        
        if (bottom < top) {
            break
        }
        
        //prints bottom side of previously trimmed matrix, going right to left, decrementing by 1
        for j in stride(from: right, through: left, by: -1)  {
            spiralArray.append(matrix[bottom][j])
            spiralString += "\(matrix[bottom][j]) "
        }
        
        //decreases bottom by one, therefore trimming matrix, matrix[count - 1][j] -> matrix[count - 2][j] next loop
        bottom -= 1

        if right < left {
            break
        }
        
        //prints left side of previously trimmed matrix, going bottom to top, decrementing by 1
        for j in stride(from: bottom, through: top, by: -1) {
            spiralArray.append(matrix[j][left])
            spiralString += "\(matrix[j][left]) "
        }
        
        //increases left by one, therefore trimming matrix, matrix[j][1] -> matrix[j][2] next loop
        left += 1
        
    }
    
//    print(spiralArray)
    spiralArray.forEach({ testString += "\($0) "})
    testString.trimmingCharacters(in: .whitespacesAndNewlines)
    print("For each: \(testString)")
    spiralString.trimmingCharacters(in: .whitespacesAndNewlines)
//    print(spiralString)
}

spiralOrder(matrix: matrix)

matrix.count
matrix[0].count
for i in 0..<matrix[0].count {
    print(matrix[0][i])
    print(matrix[1][i])
}
