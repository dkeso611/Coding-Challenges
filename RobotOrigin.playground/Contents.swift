import UIKit

//There is a robot starting at position (0, 0), the origin, on a 2D plane. Given a sequence of its moves, judge if this robot ends up at (0, 0) after it completes its moves.

//The move sequence is represented by a string, and the character moves[i] represents its ith move. Valid moves are R (right), L (left), U (up), and D (down). If the robot returns to the origin after it finishes all of its moves, return true. Otherwise, return false.

func returnedToOrigin(moves: String) {
    var moveDictionary = ["L": [0,-1], "R": [0,1], "U": [-1,0], "D": [1,0]]
    var robot = [0,0]
    
    for move in moves {
        let moveString = String(move).uppercased()
        if moveDictionary[moveString] != nil {
            let r = moveDictionary[moveString]![0]
            let c = moveDictionary[moveString]![1]
            
            if robot[0] + r >= 0 && robot[1] + c >= 0 {
                robot[0] += r
                robot[1] += c
            }
        }
    }
    
    if robot == [0,0] {
        print("true", robot)
    } else {
        print("false", robot)
    }
}

var moves = "rRruddlulul"

returnedToOrigin(moves: moves)


