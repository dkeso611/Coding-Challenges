import UIKit

var matrix = [[5, 7, 8, 6, 3],
              [0, 0, 7, 0, 4],
              [4, 6, 3, 4, 9],
              [3, 1, 0, 5, 8]]

func spiralOrder(matrix: [[Int]]) {
    var spiralArray: [Int] = []
    var spiralString = ""
    var testString = ""
    let rowCount = matrix.count //rows
    let columnCount = matrix[0].count //columns
    
    var left = 0
    var right = columnCount - 1
    var top = 0
    var bottom = rowCount - 1
    
    if matrix.count == 0 || matrix[0].count == 0 || matrix == [[]] {
        print(spiralArray)
        print(spiralString)
        
    }
    
//    while spiralArray.count < n * m  {
    while top <= bottom && left <= right  {
    
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
    print(spiralString)
        print(spiralArray.count)
}

spiralOrder(matrix: matrix)

