import UIKit

class IslandPerimeter{
    func findIslandPerimeter(matrix: [[Int]]) {
        var matrix = matrix
        let rows = matrix.count - 1
        let columns = matrix[0].count - 1
        var island = 0
        var neighbors = 0
        
        for row in 0...rows {
            for column in 0...columns {
                if matrix[row][column] == 1 {
                    findSides(matrix: &matrix, row: row, column: column)
                    island += 1
                    
//                    if row < matrix.count - 1 && matrix[row + 1][column] == 1 {
//                        neighbors += 1
//                    }
//                    if column < matrix[row].count - 1 && matrix[row][column + 1 ] == 1 {
//                        neighbors += 1
//                    }
                }
            }
        }
        
        for i in matrix {
            print(i)
        }
        
        print(island * 4 - neighbors * 2)
    }
    
    
    func findSides(matrix: inout [[Int]], row: Int, column: Int) {
        var toVisit = [[row, column]]
        let directionDict = ["Left": [0, -1], "Right": [0, 1], "Up": [-1, 0], "Down": [1, 0]]
        var perimeter = 0
        var neighbors = 0
        
        while !toVisit.isEmpty {
            var visited = toVisit.removeFirst()
            let visitedRow = visited[0]
            let visitedColumn = visited[1]
            
//            matrix[visitedRow][visitedColumn] = 2
            perimeter += 1
            
            for direction in directionDict {
                let r = direction.value[0]
                let c = direction.value[1]
                
                if visitedRow + r >= 0 && visitedRow + r < matrix.count && visitedColumn + c >= 0 && visitedColumn + c < matrix[0].count {
                    if matrix[visitedRow + r][visitedColumn + c] == 1 {
                        toVisit.append([visitedRow + r, visitedColumn + c])
                        neighbors += 1
                        
//                        if visitedRow + r == 0 || visitedRow + r == matrix.count - 1  {
//                            perimeter -= 1
//                        }
//
//                        if visitedColumn + c == 0 || visitedColumn + c == matrix[0].count - 1 {
//                            perimeter -= 1
//                        }
                    }
                    
//                    if visitedRow + r == 0 || visitedRow + r == matrix.count - 1  {
//                        perimeter += 1
//                    }
//
//                    if visitedColumn + c == 0 || visitedColumn + c == matrix[0].count - 1 {
//                        perimeter += 1
//                    }
                    
//                    if matrix[visitedRow + r][visitedColumn + c] == 0 {
//                        perimeter += 1
//                    }
                }
                matrix[visitedRow][visitedColumn] = 2

            }
        }

     print((perimeter * 2) + 2)
    }
}

var matrix = [[0,1,0,0],
              [1,1,1,0],
              [0,1,0,0],
              [1,1,0,0]]

var island = IslandPerimeter()
island.findIslandPerimeter(matrix: matrix)
