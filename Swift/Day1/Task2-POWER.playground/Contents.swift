import UIKit

func calcPower(base: Int, power: Int ) -> Int {
    var res = 1
    for index in 1...power{
        res = res * base
    }
    return res
}
var b = 10
var p = 3
print("result of power \(p) of base \(b) is equal : \(calcPower(base: b, power: p))")
