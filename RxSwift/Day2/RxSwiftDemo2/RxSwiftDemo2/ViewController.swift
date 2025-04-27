//
//  ViewController.swift
//  RxSwiftDemo2
//
//  Created by Usef on 03/02/2025.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createObservable()
    }
    func createObservable(){
        let observable = Observable<Int>.create { observer in
            observer.onNext(1)
            observer.onNext(2)
            observer.onCompleted()
            reurn Disposables.create()
        }
        observable.subscribe { value in
            self.statusLB.text = "\(value)"
        }onComplete: {
            print("on Completed!!!")
        }.dispose(by: disposeBag)
    }


}

