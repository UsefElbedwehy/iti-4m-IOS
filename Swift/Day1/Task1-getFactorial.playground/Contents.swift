import UIKit
var userNum = 5
func getFactorial(number: Int) -> (Int) {
    var num = 1
    for index in 2...number{
        num = num * index
    }
    return num
}

print("Factorial number of \(userNum) is \(getFactorial(number: userNum))")
