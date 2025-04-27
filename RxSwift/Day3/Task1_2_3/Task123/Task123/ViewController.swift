//
//  ViewController.swift
//  Task123
//
//  Created by Usef on 04/02/2025.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let diposedBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("========== - TASK - 1 - =================")
        print("=========== testCombineLatest() ============")
        testCombineLatest()
        print("===================================")
        print("=========== testPublishSubject() ============")
        testPublishSubject()
        print("=========== testBehaviorSubject() ============")
        testBehaviorSubject()
        print("========== - TASK - 3 - =================")
        print("=========== testReplaySubject() ============")
        testReplaySubject()
        print("===================================")
    }
    func testCombineLatest(){
        // 1 2 3 4 5
        //  5 4 3 2 1
        // 15 25 24 34 43 42 52 51
        let observable1 = Observable.of(1,2,3,4,5)
        let observable2 = Observable.of(5,4,3,2,1)
        Observable.combineLatest(observable1, observable2).subscribe { (val1,val2) in
            print("val1:\(val1) and val2:\(val2)")
        }.disposed(by: diposedBag)
    }
    
    func testPublishSubject(){
        //Starts empty and only emits new elements to subscribers.
        let subject = PublishSubject<String>()
        subject.onNext("published data.")
        let firstSubsriper = subject.subscribe(onNext: { String in
            print("from 1st: \(String)")
        }).disposed(by: diposedBag)
        subject.onNext("two")
        subject.onNext("three")
        let secondSubsriper = subject.subscribe (onNext: { String in
            print("from 2nd: \(String)")
        }).disposed(by: diposedBag)
        subject.onNext("four")
        subject.onNext("five")
        subject.onCompleted()
        subject.onNext("six")
    }

    func testBehaviorSubject(){
        // Starts with an initial value and replays it or the latest element to new subscribers.
        let subject = BehaviorSubject(value: 3)
        subject.onNext(2)
        subject.onNext(5)
        subject.onNext(4)
        let firstSubscriber = subject.subscribe { val in
            print("first sub: \(val)")
        }
        let secondSubsriper = subject.subscribe { val in
            print("second sub: \(val)")
        }
    }
    func testReplaySubject(){
        // Initialized with a buffer size and will maintain a buffer of elements up to that size and replay it to new subscribers.
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        subject.onNext("one")
        subject.onNext("two")
        subject.onNext("three")
        subject.onNext("four")
        subject.onNext("five")
        subject.subscribe (onNext: { String in
            print("sub: \(String)")
        }).disposed(by: diposedBag)
        subject.onNext("six")
        subject.onCompleted()
        subject.onNext("seven")
    }
    
    
    

}

