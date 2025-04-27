//
//  SecondViewController.swift
//  RxSwift_Demo1
//
//  Created by Usef on 03/02/2025.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLB: UILabel!
    
    @IBOutlet weak var debounceBtn: UIButton!
    
    @IBOutlet weak var throttleBtn: UIButton!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        useSubscribeOn()
//        testDebounce()
//        testThrottle()
//        task3()
    }
    //----------------------------------------------------------------
    //lab2 ------------------------------------------------------
    //----------------------------------------------------------------
    func getLargeArray() -> [Double] {
        var array:[Double] = []
        for num in 0...1000000{
            array.append(Double(num))
        }
        return array
    }
    func useSubscribeOn(){
        let arr = getLargeArray()
        var sum = 0.0
        var counter = 0.0
        var firstElemenet = 0.0
        
        let observable = Observable<Double>.from(arr)
        let mainSchedular = MainScheduler.instance
        let bachgroundSchedular = ConcurrentDispatchQueueScheduler(qos: .background)
        
        observable
            .subscribe(on: bachgroundSchedular)
            .observe(on: mainSchedular)
            .take(1)
            .subscribe { value in
                firstElemenet = value
        }onCompleted:{
            self.resultLB.text = "first element:\(firstElemenet) ,array count: \(counter),sum: \(sum)"
            print(sum)
            print("On completed!")
        }.disposed(by: self.disposeBag)
        
        
        observable
            .subscribe(on: bachgroundSchedular)
            .observe(on: mainSchedular)
            .scan(0) { val , item in
                counter = counter + 1
                return val + item
            }
            .subscribe { value in
                sum = value
        }onCompleted:{
            self.resultLB.text = "first element:\(firstElemenet) ,array count:\(counter) ,sum: \(sum)"
            print(sum)
            print(counter)
            print("On completed!")
        }.disposed(by: self.disposeBag)
    }

    func testDebounce(){
        var counter1 = 0
        debounceBtn.rx.tap.debounce(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe{ value in
//                print(value)
                counter1 = counter1 + 1
                print("Debounce: \(counter1)")
            }onCompleted: {
                print("on comp")
            }.disposed(by: disposeBag)
    }
    func testThrottle(){
        var counter2 = 0
        throttleBtn.rx.tap.throttle(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe{ value in
//                print(value)
                counter2 = counter2 + 1
                print("Throttle: \(counter2)")
            }onCompleted: {
                print("on comp")
            }.disposed(by: disposeBag)
    }
    func task3(){
        let observable = Observable.of(1,2,3,4,5,6,7,8,9,10)
        observable.map ({ $0 * 5 })
            .filter { $0 % Int(2.0) == 0 }
            .skip(2).subscribe{
                value in
                print(value)
            }onCompleted: {
                print("on comp")
            }.disposed(by: disposeBag)
    }
}
