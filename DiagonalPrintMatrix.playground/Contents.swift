import UIKit

func diagonalPrint(matrix: [[Int]]) {
    let rows = matrix.count - 1
    let columns = matrix[0].count - 1
    let diagonalArray: [Int] = []
    
    var left = 0 //column index
    var right = columns
    var top  = 0 //row index
    var bottom = rows
    
//    while diagonalArray.count < rows * columns {
    
    for i in stride(from: left, through: left + 1, by: 1) {
        print(matrix[top][i])
    }
    
//    top += 1
    for i in stride(from: top, through: top + 1, by: 1) {
        print(matrix[i + 1][top])
//        print(matrix[1][0])
    }
    
    left += 1
    for i in stride(from: left, through: left + 1, by: -1) {
        
    }
//    while top <= bottom && left <= right {
//        for i in stride(from: left, through: left + 1, by: 1) {
//            matrix[top][i]
//        }
//
//        left += 1
//    }
    
}

var matrix = [[5, 7, 8, 6, 3],
              [2, 0, 7, 0, 4],
              [4, 6, 3, 4, 9],
              [3, 1, 0, 5, 8]]

diagonalPrint(matrix: matrix)
