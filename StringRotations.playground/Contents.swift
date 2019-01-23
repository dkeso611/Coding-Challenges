import UIKit
//We are given two strings, A and B.
//A shift on A consists of taking string A and moving the leftmost character to the rightmost position. For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.


func stringRotation(stringA: String, stringB: String) {
    if stringA.count == stringB.count && (stringA + stringA).contains(stringB) {
        print(stringA + stringA)
        print(true)
    } else {
        print(false)
    }
}

var a = "abcde"
var b = "bcdea"

stringRotation(stringA: a, stringB: b)
