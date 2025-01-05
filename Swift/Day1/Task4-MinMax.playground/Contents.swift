import UIKit

let arr:[Int] = [ 5 , 3 , 7 , 6 , 4 , 1 , 9 , 0 , 2]

func calMinAndMax(srcArr:[Int]) -> (Int , Int) {
    var maxNum = srcArr[0]
    var minNum = srcArr[0]
    for index in srcArr {
        if index < minNum {
            minNum = index
        }else if index > maxNum{
            maxNum = index
        }
    }
    return (maxNum , minNum)
}

print("(max , min) : \(calMinAndMax(srcArr: arr))")
