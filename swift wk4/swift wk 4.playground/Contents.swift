import UIKit

func ifOdd(number: Int) -> Bool {
    if number % 2 == 1 {
        return true
    }
    return false
}

ifOdd(number: 9)


var ifOddFunc: ((Int) -> Bool) = {anyNumber in
    if anyNumber % 2 == 1 {
        return true
    }
    return false
}

ifOddFunc(9)
