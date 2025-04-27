import UIKit
import Combine

let label = UILabel()
let publisher = Just("Hello World!")
    .map({ "say: \($0)" })
    .assign(to: \.text, on: label)
print(label.text)



//
//let _ = Just("Hello iti")
//    .sink { val in
//    print("status: \(val)")
//}receiveValue: { val in
//    print("res = \(val)")
//}
//
//enum futureError:Error{
//    case notEven
//}
//
//func generateEvenFuture() ->Future<Int,futureError> {
//    return Future { promise in
//        let num = Int.random(in: 1...10)
//        if num % 2 == 0 {
//            promise(.success(num))
//        }else{
//            promise(.failure(.notEven))
//        }
//    }
//}
//let cancelable = generateEvenFuture().sink { complition in
//    switch complition {
//    case .failure(let error):
//        print(error)
//    case .finished:
//        print("Finished")
//    }
//}receiveValue: { value in
//    print("Received value: \(value)")
//}
//


[1,2,3,4,5].publisher
    .map { $0 * 2 }
    .sink { value in
    print(value)
}
let urlString = "https://gist.githubusercontent.com/saniyusuf/406b843afdb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON"

let url = URL(string: urlString)

struct Film : Decodable {
    let Title:String?
    let Year:String?
    let Director:String?
}

let data = URLSession.shared.dataTaskPublisher(for: url!)
    .map{$0.data}
    .decode(type: [Film].self, decoder: JSONDecoder())
    .sink { complition in
        print(complition)
    } receiveValue: { films in
        print(films[0].Title ?? "")
    }

