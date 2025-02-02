//
//  ViewController.swift
//  RxSwift_Demo1
//
//  Created by Usef on 02/02/2025.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    @IBOutlet weak var statusLB: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let one     = 1
        let two     = 2
        let three   = 3
        let obs1 : Observable<Int> = Observable.just(one)
        obs1.subscribe(
            onNext: {r in print(r)},
            onCompleted:{
                print("completed!!!")}).disposed(by: disposeBag)
        
        let obs2 : Observable<Int> = Observable.of(one,two,three)
        let obs3 : Observable<[Int]> = Observable.of([one,two,three])
        let obs4 : Observable<Int> = Observable.from([one,two,three])
        
        let observable : Observable<String> = Observable<String>.create { observer in
            observer.onNext("1")
            observer.onCompleted()
            observer.onNext("2")
            
            return Disposables.create()
        }
        observable.subscribe { print($0) }.disposed(by: disposeBag)
        statusSwitch.rx.value.subscribe { [weak self] switchStatus in
            guard let self = self else{
                return
            }
            if switchStatus == true {
                self.statusLB.text = "Switch is ON"
            }else{
                self.statusLB.text = "Switch is OFF"
            }
        }
        
    }
}
