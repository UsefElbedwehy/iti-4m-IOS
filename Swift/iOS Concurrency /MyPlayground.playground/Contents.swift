import UIKit

let maxConcurrence = 3
let semaphore = DispatchSemaphore(value: maxConcurrence)

let downloadQueue = DispatchQueue(label: "com.app.download",attributes: .concurrent)

func thread() {
    for index in 0...15 {
        downloadQueue.async {
            // lock
            semaphore.wait()
            
           download(1+index)
            
            // release lock
            semaphore.signal()
        }
    }
}
func download(_ id: Int) {
    print("started with id:\(id)")
    var counter=0
    for index in 0...99999 {
        counter = index + id
    }
    print("downloaded with id:\(id)")
}
thread()
