import UIKit

class NumOfIslands {
    
    func numberOfIslands(matrix: [[Int]]) -> Int {
        var matrix = matrix
        let rows = matrix.count
        let columns = matrix[0].count
        
        if matrix == [[]] {
            return 0
        }
        
        var islandCounter = 0
        
        for row in 0..<rows {
            for column in 0..<columns {
                if matrix[row][column] == 1 {
                    //Checks if part of island and changes all the islands to "2"
                    checkPartsOfIsland(matrix: &matrix, row: row, column: column)
                    islandCounter += 1
                }
            }
        }
        
        for i in matrix {
            print(i)
        }
        
        return islandCounter
    }
    
    func checkPartsOfIsland( matrix: inout [[Int]], row: Int, column: Int) {
        
        var toVist = [[row, column]]
        let directionDict = ["Left": [0, -1], "Right": [0, 1], "Up": [-1, 0], "Down": [1, 0]]
        
        while !toVist.isEmpty {
            var visited = toVist.removeFirst()
            let visitedRow = visited[0]
            let visitedColumn = visited[1]
            
            matrix[visitedRow][visitedColumn] = 2
            
            //checking if values around are also 1
            for direction in directionDict {
                let r = direction.value[0]
                let c = direction.value[1]
                
                if visitedRow + r >= 0 && visitedRow + r < matrix.count && visitedColumn + c >= 0 && visitedColumn + c < matrix[0].count {
                    if matrix[visitedRow + r][visitedColumn + c] == 1 {
                        //adds values to a queue to also check if there are 1's around
                       toVist.append([visitedRow + r, visitedColumn + c])
                    }
                    
                }
            }
//            matrix[visitedRow][visitedColumn] = 2
        }
    }
}

var matrix = [[1, 1, 1, 0],
              [0, 0, 0, 1],
              [1, 1, 1, 0],
              [0, 0, 0, 1]]

var islands = NumOfIslands()
islands.numberOfIslands(matrix: matrix)
