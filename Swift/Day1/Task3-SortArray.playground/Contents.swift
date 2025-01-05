import UIKit

var arr:[Int] = [ 4 , 2 , 5 , 8 , 5 , 3 , 9 ,1 ,0 ]
print("Bsfore sort: \(arr)")

func sortArray(srcArr: inout [Int]) {
    for j in 0..<srcArr.count-1 {
        for i in 0..<srcArr.count-1-j {
        if srcArr[i] > srcArr[i+1] {
            let temp = srcArr[i]
            srcArr[i] = srcArr[i+1]
            srcArr[i+1] = temp
        }
      }
    }
}

sortArray(srcArr: &arr)
print("After  sort: \(arr)")


