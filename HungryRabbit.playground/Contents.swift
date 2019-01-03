import UIKit


/*
 A very hungry rabbit is placed in the center of of a garden, represented by a rectangular N x M 2D matrix.
 
 The values of the matrix will represent numbers of carrots available to the rabbit in each square of the garden. If the garden does not have an exact center, the rabbit should start in the square closest to the center with the highest carrot count.
 
 On a given turn, the rabbit will eat the carrots available on the square that it is on, and then move up, down, left, or right, choosing the the square that has the most carrots. If there are no carrots left on any of the adjacent squares, the rabbit will go to sleep. You may assume that the rabbit will never have to choose between two squares with the same number of carrots.
 
 Write a function which takes a garden matrix and returns the number of carrots the rabbit eats. You may assume the matrix is rectangular with at least 1 row and 1 column, and that it is populated with non-negative integers.
 */

class HungryBunny {
    
    class func eat(matrix:[[Int]]) -> Int? {
        var middleIndex = middle(matrix: matrix)
        
        guard let startRow = middleIndex[0], let startColumn = middleIndex[1] else {
            return 0
        }
        
        return moveBunny(matrix: matrix, row: startRow, column: startColumn)
    }
    
    private class func middle(matrix: [[Int]]) -> [Int?] {
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        var rowsIndices: [Int] = []
        var columnIndices: [Int] = []
        var midRow: Int?
        var midColumn: Int?
        var max = 0
        
        if rowCount % 2 != 0 {
//            print("rows not even")
            rowsIndices.append(rowCount/2)
        } else {
//            print("rows even")
            rowsIndices.append(rowCount/2)
            rowsIndices.append(rowCount/2 - 1)
        }
        
        if columnCount % 2 != 0 {
//            print("cols not even")
            columnIndices.append(columnCount/2)
        } else {
//            print("cols even")
            columnIndices.append(columnCount/2)
            columnIndices.append(columnCount/2 - 1)
        }

        
        for rowIndex in rowsIndices {
            for columnIndex in columnIndices {
                if matrix[rowIndex][columnIndex] >= max {
                    max = matrix[rowIndex][columnIndex]
                    midRow = rowIndex
                    midColumn = columnIndex
//                    print(max)
                }
            }
        }
        
        guard let middleRow = midRow, let middleCol = midColumn else {
            print("No carrots around!")
            
            return [nil]
        }
         print(matrix[middleRow][middleCol])
        
        return [middleRow, middleCol]
    }
    
    private class func moveBunny(matrix: [[Int]], row: Int, column: Int) -> Int {
        var garden = matrix
        let rowCount = garden.count
        let columnCount = garden[0].count
        let currentRow = row
        let currentColumn = column
        var nextRowIndex: Int?
        var nextColIndex: Int?
        var max = 0
        var carrots = 0

        let directionDict = ["Left": [0, -1], "Right": [0, 1], "Up":[-1, 0], "Down": [1, 0]]
//        let directionsDict = [[0, -1]: "Left", [0, 1]: "Right", [-1, 0]: "Up", [1, 0]: "Down"]
        
        if currentRow < 0 || currentColumn < 0 {
            return 0
        }
        
        for direction in directionDict {
            let rowIndex = direction.value[0]
            let columnIndex = direction.value[1]

//            let r = direction.key[0]
//            let c = direction.key[1]
            if (currentRow + rowIndex >= 0) && (currentRow + rowIndex < rowCount) && (currentColumn + columnIndex >= 0) && (currentColumn + columnIndex < columnCount) {
                
                if garden[currentRow + rowIndex][currentColumn + columnIndex] > max {
                    max = garden[currentRow + rowIndex][currentColumn + columnIndex]
                    nextRowIndex = currentRow + rowIndex
                    nextColIndex = currentColumn + columnIndex
                }
            }
        }
        
        //Will always end here in recursion. When max/surrounding equals 0, nextrow and nextcol index equals nil
        //max is initialized as 0 on every recursion, nextrow and nextcol is only set if max is greater than 0
        guard let nextRow = nextRowIndex, let nextColumn = nextColIndex else {
            carrots = garden[currentRow][currentColumn]
            garden[currentRow][currentColumn] = 0
            
            for array in garden {
                print(array)
            }
            
            print("carrots: \(carrots)")
            
            return carrots
        }
        
//        Print direction names
//        let move = [nextRow - currentRowIndex, nextCol - currentColIndex]
//        let direction = directionDict.filter({$0.value == move}).keys.first!
//        let direction = directionsDict[move]
//
//        print(direction!)
        
        //Max is largest value in the surrounding, continue recusion until max = 0/surroundings = 0
        if garden[nextRow][nextColumn] > 0 {
            carrots += garden[currentRow][currentColumn]
            garden[currentRow][currentColumn] = 0
            carrots += moveBunny(matrix: garden, row: nextRow, column: nextColumn)
        }
        
        print("carrots: \(carrots)")
        
        return carrots
    }
    
}

var matrix = [[5, 7, 8, 6, 3],
              [1, 0, 0, 0, 4],
              [4, 0, 0, 0, 7],
              [3, 1, 0, 5, 8],
              [4, 0, 3, 0, 9]]

var anotherMatrix = [[ 7, 8, 2, 3],
                     [ 4, 0, 0, 4],
                     [ 0, 1, 0, 9],
                     [ 1, 0, 0, 8]]

var asana = [[5, 7, 8, 6, 3],
             [0, 0, 7, 0, 4],
             [4, 6, 3, 4, 9],
             [3, 1, 0, 5, 8]]


var bunny = HungryBunny.eat(matrix: matrix)
//var carrotsAte = bunny.eat(matrix: asana )
//print(carrotsAte!)
//HungryBunny.eat(matrix: <#T##[[Int]]#>)
