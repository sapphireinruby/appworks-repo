import UIKit

func ifOdd(number: Int) -> Bool {
    if number % 2 == 1 {
        return true
    }
    return false
}

var ifOddFunc: ((Int) -> Bool) = {number in
    if number % 2 == 1 {
        return true
    }
    return false
}


ifOddFunc(9)
