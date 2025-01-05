import UIKit

var firstNum = 11
var secondNum = 44

print("first number: \(firstNum) and second number : \(secondNum)")

func swap(fNum: inout Int,sNum: inout Int) {
    let temp = fNum
    fNum = sNum
    sNum = temp
}

swap(fNum: &firstNum, sNum: &secondNum)

print("first number: \(firstNum) and second number : \(secondNum)")
