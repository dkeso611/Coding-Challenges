import UIKit

func divide(dividend: Int, by divisor: Int) -> Int {
    let sign = (dividend < 0 && divisor < 0) || (dividend > 0 && divisor > 0) ? 1 : -1
    var dividend = abs(dividend)
    let divisor = abs(divisor)
    var quotient = 0
    var remainder = 0
    
//    if (dividend < 0 && divisor < 0) || (dividend > 0 && divisor > 0) {
//        sign = 1
//    } else {
//        sign = -1
//    }
    
    while dividend >= divisor {
        dividend -= divisor
        quotient += 1
    }
    
    remainder = dividend
    quotient = quotient * sign
    
    print("Quotient: \(quotient), Remainder: \(remainder)")
    return quotient
}

func bitDivide(dividend: Int, by divisor: Int) -> Int {
    let sign = (dividend < 0 && divisor < 0) || (dividend > 0 && divisor > 0) ? 1 : -1
    let dividend = abs(dividend)
    let divisor = abs(divisor)
    var denominator = divisor
    var quotient = 1
    var remainder = 0
    
    //Double divisor until its larger than the dividend using bit shifts
    while dividend > denominator {
        denominator <<= 1
        quotient <<= 1
        print(denominator)
    }
    
    print(denominator, quotient)
    
    //Subtract divisor  from denominator until it is smaller than dividend
    while  denominator > dividend {
        denominator -= divisor
        quotient -= 1
    }
    
    remainder = dividend - denominator
    quotient *= sign

    print("Quotient: \(quotient), Remainder: \(remainder)")
    return quotient * sign
    
}

divide(dividend: 20, by: -6)
bitDivide(dividend: 20, by: -6)
