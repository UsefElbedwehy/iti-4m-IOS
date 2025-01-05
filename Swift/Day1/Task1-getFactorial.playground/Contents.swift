import UIKit
var userNum = 5
func getFactorial(number: Int) -> (Int) {
    var num = 1
    if number == 0{
        return 0
    }
    for index in 1...number{
        num = num * index
    }
    return num
}
print("Factorial number of \(userNum) is \(getFactorial(number: userNum))")

func getFactorialRec(number: Int) -> (Int) {
    if number == 1{
        return 1
    }
    return number * getFactorialRec(number: number-1)
}

print("Factorial number of \(userNum) is \(getFactorialRec(number: userNum))")
