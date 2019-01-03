import UIKit

class HungryBunny {
    
    func eat(matrix:[[Int]]) -> Int {
        var middleIndex = middle(matrix: matrix)
        
        guard let startRow = middleIndex[0], let startCol = middleIndex[1] else {
            return 0
        }
        
        return moveBunny(matrix: matrix, row: startRow, col: startCol)
    }
    
    private func middle(matrix: [[Int]]) -> [Int?] {
        let rows = matrix.count
        let cols = matrix[0].count
        var rowsIndices: [Int] = []
        var colIndices: [Int] = []
        var midRow: Int?
        var midCol: Int?
        var max = 0
        
        if rows % 2 != 0 {
            //            print("rows not even")
            rowsIndices.append(rows/2)
        } else {
            //            print("rows even")
            rowsIndices.append(rows/2)
            rowsIndices.append(rows/2 - 1)
        }
        
        if cols % 2 != 0 {
            //            print("cols not even")
            colIndices.append(cols/2)
        } else {
            //            print("cols even")
            colIndices.append(cols/2)
            colIndices.append(cols/2 - 1)
        }
        
        
        for r in rowsIndices {
            for c in colIndices {
                if matrix[r][c] >= max {
                    max = matrix[r][c]
                    midRow = r
                    midCol = c
                }
            }
        }
        
        guard let middleRow = midRow, let middleCol = midCol else {
            print("No carrots")
            
            return [nil]
        }
        
        return [middleRow, middleCol]
    }
    
    private func moveBunny(matrix: [[Int]], row: Int, col: Int) -> Int {
        var garden = matrix
        let rows = garden.count
        let columns = garden[0].count
        var currentRowIndex = row
        var currentColIndex = col
        var nextRowIndex: Int?
        var nextColIndex: Int?
        var carrots = 0
        let directionDict = ["Left": [0, -1], "Right": [0, 1], "Up":[-1, 0], "Down": [1, 0]]
        
        
        if currentRowIndex < 0 || currentColIndex < 0 {
            return 0
        }
        
        var max = 1
//        while garden[currentRowIndex][currentColIndex] != 0 {
            while max > 0 {
                max = 0
                for direction in directionDict {
                    let r = direction.value[0]
                    let c = direction.value[1]

                    if currentRowIndex + r >= 0 && currentRowIndex + r < rows && currentColIndex + c >= 0 && currentColIndex + c < columns {
                        if garden[currentRowIndex + r][currentColIndex + c] > max {
                            max = garden[currentRowIndex + r][currentColIndex + c]
                            nextRowIndex = currentRowIndex + r
                            nextColIndex = currentColIndex + c
                        }
                    }
                }
                
                guard let nextRow = nextRowIndex, let nextCol = nextColIndex else {
                    carrots = garden[currentRowIndex][currentColIndex]
                    garden[currentRowIndex][currentColIndex] = 0
                    for i in garden {
                        print(i)
                    }
                    return carrots
                
                }
            

            let move = [nextRow - currentRowIndex, nextCol - currentColIndex]
            let direction = directionDict.filter({$0.value == move}).keys.first
//            print(direction)
            carrots += garden[currentRowIndex][currentColIndex]
            garden[currentRowIndex][currentColIndex] = 0
          
            
            currentRowIndex = nextRow
            currentColIndex = nextCol

        }
                
        for i in garden {
            print(i)
        }
        
        return carrots
    }
    
}

var matrix = [[5, 7, 8, 6, 3],
              [1, 0, 1, 0, 4],
              [4, 0, 0, 0, 9],
              [3, 1, 0, 5, 8],
              [4, 0, 3, 0, 9]]

var anotherMatrix = [[ 7, 8, 2, 3],
                     [ 4, 0, 0, 4],
                     [ 0, 0, 0, 9],
                     [ 1, 0, 5, 8]]

var bunny = HungryBunny()
var carrotsAte = bunny.eat(matrix: matrix )
print(carrotsAte)

