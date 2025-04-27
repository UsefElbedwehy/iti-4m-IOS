//
//  ViewController.swift
//  demo5
//
//  Created by Usef on 06/02/2025.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var titleLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        task1()
//        task1again()
//        task2()
    }
    func task1(){
        Just("Hello MAD ITP")
            .subscribe(on: DispatchConcurrentQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {complition in
                print(complition)},
                  receiveValue: {val in
                print("received:",val)
                self.titleLB.text = val
            })
    }
    func task1again(){
        let subject = PassthroughSubject<String, Never>()
        subject.subscribe(on: DispatchConcurrentQueue.global(qos: .background))
        subject.receive(on: RunLoop.main)
        let subscriber = subject.sink(receiveValue: {val in
            print(val)
            self.titleLB.text = val
        })
        subject.send("Hello MAD ITP!")
    }
    let bounces:[(Int,TimeInterval)] =
    [ (1, 1),(2, 2),(3, 3),(4, 4),(5, 5) ]
    var cancellable1:Cancellable!
    func task2(){
        let subject = PassthroughSubject<Int, Never>()
        cancellable1 = subject
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .sink { index in
                print ("Received index \(index)")
                self.titleLB.text = String(index)
            }
        for bounce in bounces {
            DispatchQueue.main.asyncAfter(deadline: .now() + bounce.1) {
                subject.send(bounce.0)
            }
        }
    }
    
    func testPassThroughSubject(){
        let subject = PassthroughSubject<Int,Never>()
        let subscriber = subject.sink { print($0) }
        subject.send(100)
        Just(300).subscribe(subject)
        subject.send(100)
        
    }
    func testCurrentValueSubject(){
        let subject = CurrentValueSubject<String,Never>("We are studing ")
        let subscription = subject.sink{print($0)}
        subject.send(",now SwiftUI")
        
    }
    struct Film : Decodable {
        var Title:String?
    }
    enum ApiError:Error {
        case invalidResponse
        case unCompleteResponse
    }
    func testTryCatch(){
        let url = URL(string: "")
        let publisher = URLSession.shared.dataTaskPublisher(for: url!)
            .map{$0.data}
            .decode(type: [Film].self , decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case URLError.cannotFindHost:
                    return ApiError.invalidResponse
                default:
                    return ApiError.unCompleteResponse
                }
            }.sink { val in
                print(val)
            } receiveValue: { films in
                print(films.count)
            }

    }
    func testTryMap()  {
        Just("Hello Amdani")
            .retry(3)
            .tryMap { _ in
                throw ApiError.unCompleteResponse
            }.catch { error in
                Just("error")
            }.sink { value in
                print(value)
            } receiveValue: { value in
                print(value)
            }

    }
    
}

