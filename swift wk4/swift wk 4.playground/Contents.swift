import UIKit

func ifOdd(number: Int) -> Bool {
    if number % 2 == 1 {
        return true
    }
    return false
}

ifOdd(number: 9)


var ifOddFunc: ((Int) -> Bool) = {anyNumber in
    //to start the body of the function in closure, use "in" like {
    
    if anyNumber % 2 == 1 {
        return true
    }
    return false
}

ifOddFunc(9)


//var anotherOddFunc = {(a: Int) -> Bool in
//    if a % 2 == 1 {
//        return true
//    }
//    return false
//}
//
//anotherOddFunc(8)


    

//var ifOddVar = ifOdd //This is just a varible
//
//ifOddVar(11)


