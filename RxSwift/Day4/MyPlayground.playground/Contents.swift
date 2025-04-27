import UIKit
import Combine


[1,2,3,4,4].publisher
    .removeDuplicates()
//Provides a stream with accumulated values. The closure receives two parameters, the last value and the next.
    .scan(0) { latest ,current  in
    print("latest=\(latest) ,currrent=\(current)")
    return latest + current
}
    .collect()
    .sink { val in
    print("collection:",val)
}
print("==================== debounce ======================")

let bounces:[(Int,TimeInterval)] = [
//    (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5)
]
let subject = PassthroughSubject<Int, Never>()
var cancellable1 = subject
    .delay(for: .seconds(1), scheduler: RunLoop.main)
    .sink { index in
        print ("Received index \(index)")
    }
for bounce in bounces {
    DispatchQueue.main.asyncAfter(deadline: .now() + bounce.1) {
        subject.send(bounce.0)
    }
}
print("=================== catch =========================")
struct SimpleError: Error {}
let numbers = [1,2,3,4,0,9]
var cancelable = numbers.publisher
    .tryLast(where: { val in
        guard val != 0 else {throw SimpleError()}
                return true
    })
    .catch({ (error) in
        Just(-1)
    })
    .sink { val in
    print("res:",val)
}
print("===================================================")
let urlString = "https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON"

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

print("===================================================")
