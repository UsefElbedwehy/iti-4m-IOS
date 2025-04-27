//
//  ViewController.swift
//  RxSwift_Demo1
//
//  Created by Usef on 02/02/2025.
//

import UIKit
//import RxSwift
//import RxCocoa
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var statusLB: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    var data:[User]?
    @IBOutlet weak var myBtn: UIButton!
    var dataPublisher:AnyCancellable?
//    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//                let one     = 1
//                let two     = 2
//                let three   = 3
//                let obs1 : Observable<Int> = Observable.just(one)
//                obs1.subscribe(
//                    onNext: {r in print(r)},
//                    onCompleted:{
//                        print("completed!!!")}).disposed(by: disposeBag)
//        let observer = Observable<[Int]>.of([1],[2],[3])
//        observer.subscribe(onNext: { value in
//            print("val: ",value)
//        }, onError: { error in
//            print(error.localizedDescription)
//        }, onCompleted: {
//            print("comleted")
//        }, onDisposed: {
//            print("disposed")
//        }).disposed(by: disposeBag)
//
//        let observerFrom = Observable<Int>.from([1,2,3])
//        observerFrom.subscribe(onNext: { value in
//            print("val: ",value)
//            
//        },onCompleted: {
//            print("On completed")
//        })
//        .disposed(by: disposeBag)
//    
//        
//        Observable<Int>.create { observer in
//            observer.onNext(1)
//            observer.onNext(1)
//            observer.onNext(3)
//            observer.onNext(2)
//            observer.onNext(5)
//            observer.onNext(7)
//            observer.onCompleted()
//            return Disposables.create()
//        }.subscribe(onNext: { value in
//            print(value)
//        },onCompleted: {
//            print("Completed")
//        }).disposed(by: disposeBag)
//        
//        statusSwitch.rx.value.subscribe(onNext: {[weak self] valie in
//            if valie == true {
//                self?.statusLB.text = "ON"
//            }else {
//                self?.statusLB.text = "OFF"
//            }
//        }, onCompleted: {
//            print(#function)
//        }, onDisposed: {
//            print(#function)
//        }).disposed(by: disposeBag)
//            
//        let sub = PublishSubject<String>()
//        sub.onNext("any one listening??? 1")
//        
//        sub.subscribe(onNext: {
//            value in print(value)
//        }, onCompleted: {
//            print("comp")
//        }).disposed(by: disposeBag)
//        
//        sub.onNext("any one listening??? 2")
//        
//        print("========================")
//        //scheduler: main
//        let mainScheduler = MainScheduler.instance
//        //scheduler: background
//        let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
//        
//        let observableWithSchedule = Observable<Int>.of(1,2,4,6,7)
//            .observe(on: mainScheduler)
//            .subscribe(on: backgroundScheduler)
//            
//        observableWithSchedule.subscribe(onNext: { value in print(value)
//        }, onCompleted: {
//            print("comp!!!!!!")
//        })
        
        print("==================== Api session ====================")
        enum ApiError:Error {
            case invalidResponse
            case unCompleteResponse
        }
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlStr)
        guard let newUrl = url else { return }
        dataPublisher = URLSession.shared.dataTaskPublisher(for: newUrl)
            .map{$0.data}
            .decode(type: Users.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case URLError.cannotFindHost:
                    return ApiError.invalidResponse
                default:
                    return ApiError.unCompleteResponse
                }
            }
            .sink { value in
            print(":::: \(value)")
            } receiveValue: { [weak self] items in
                self?.data = items.users
        }

        
        //
        //        let obs2 : Observable<Int> = Observable.of(one,two,three)
        //        let obs3 : Observable<[Int]> = Observable.of([one,two,three])
        //        let obs4 : Observable<Int> = Observable.from([one,two,three])
        //
        //        let observable : Observable<String> = Observable<String>.create { observer in
        //            observer.onNext("1")
        //            observer.onCompleted()
        //            observer.onNext("2")
        //
        //            return Disposables.create()
        //        }
        //        observable.subscribe { print($0) }.disposed(by: disposeBag)
        //        statusSwitch.rx.value.subscribe { [weak self] switchStatus in
        //            guard let self = self else{
        //                return
        //            }
        //            if switchStatus == true {
        //                self.statusLB.text = "Switch is ON"
        //            }else{
        //                self.statusLB.text = "Switch is OFF"
        //            }
        //        }
//        filterObservanle()
        //        useSubscribeOn()
//        takeObserver()
//        scanObservable()
    }
    
    
    func createObservable(){
//        DispatchQueue.main.async{
//            
//            print("Subscribtion Code Thread: \(Thread.isMainThread)")
//            let observable = Observable<Int>.create { observer in
//                observer.onNext(1)
//                observer.onNext(2)
//                observer.onNext(3)
//                observer.onCompleted()
//                return Disposables.create()
//            }
//            DispatchQueue.global(qos: .background).async {
//                print("Observing Code Thread: \(Thread.isMainThread)")
//                observable.subscribe { [weak self] value in
//                    self!.statusLB.text = "\(value)"
//                    
//                }onCompleted:{
//                    print("On completed!")
//                }.disposed(by: self.disposeBag)
//            }
//        }

    }
//    func useSubscribeOn(){
//        
//        let observable = Observable<Int>.create { observer in
//            print("Subscribtion Code Thread: \(Thread.isMainThread)")
//            observer.onNext(1)
//            observer.onNext(2)
//            observer.onNext(3)
//            observer.onCompleted()
//            return Disposables.create()
//        }
//        
//        let mainSchedular = MainScheduler.instance
//        let bachgroundSchedular = ConcurrentDispatchQueueScheduler(qos: .background)
//        observable
//            .subscribe(on: bachgroundSchedular)
//            .observe(on: mainSchedular)
//            .subscribe { [weak self] value in
//            self!.statusLB.text = "\(value)"
//                print("Observing Code Thread: \(Thread.isMainThread)")
//        }onCompleted:{
//            print("On completed!")
//        }.disposed(by: self.disposeBag)
//        
//    }
//    func mapObservable(){
//        let observable = Observable.of(1,2,3,4)
//        observable.map ({ $0 * 2 }).subscribe{
//            value in
//            print(value)
//        }onCompleted: {
//            print("on completed!")
//        }.disposed(by: disposeBag)
//    }
//    func scanObservable(){
//        let observable = Observable.of(1,2,3,4)
//        observable.scan(0) { res, item in
//                return res + item
//        }.subscribe{
//            value in
//            print(value)
//        }onCompleted: {
//            print("on comp")
//        }.disposed(by: disposeBag)
//    }
//    func filterObservanle(){
//        let observable = Observable.of(1,5,10,15)
//        observable.filter({$0 < 4}).subscribe{ value in
//            print(value)
//        }onCompleted: {
//            print("on completed")
//        }.disposed(by: disposeBag)
//    }
//    func testDebounce(){
//        var counter = 0
//        myBtn.rx.tap.debounce(.seconds(1), scheduler: MainScheduler.instance)
//            .subscribe{ value in
//                print(value)
//                counter = counter + 1
//                self.statusLB.text = "\(counter)"
//            }onCompleted: {
//                print("on comp")
//            }.disposed(by: disposeBag)
//    }
//    func testDebounceSearch(){
//        
//    }
//    func skip(){
//        
//    }
//    func takeObserver(){
//        let observable = Observable.of(1,2,3,4,5)
//        observable.take(3).subscribe{val in
//            print(val)
//        }onCompleted: {
//            
//        }.disposed(by: disposeBag)
//    }
//    func distincitUntilChangeObserver(){
//        let observable = Observable.of(1,2,3,4,5)
//        observable.take(3).subscribe{val in
//            print(val)
//        }onCompleted: {
//            
//        }.disposed(by: disposeBag)
//    }

}
