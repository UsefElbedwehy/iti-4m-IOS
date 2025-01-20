//
//  ViewController.swift
//  OperationQueueTask1
//
//  Created by Usef on 19/01/2025.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var task1LB: UILabel!
    
    @IBOutlet weak var task2LB: UILabel!
    
    
    var queue = OperationQueue()
    
    var rawImg:UIImage? = nil
    var imgUrl = URL(string: "https://images.pexels.com/photos/1525054/pexels-photo-1525054.jpeg?cs=srgb&dl=pexels-francesco-ungaro-1525054.jpg&fm=jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadOp = BlockOperation {
            do{
                let download = try Data(contentsOf: self.imgUrl!)
                DispatchQueue.main.async {
                    self.rawImg = UIImage(data: download)
                    self.task1LB.text = "downloaded"
                    print("downloaded")
                }
            }catch{
                //self.queue.isSuspended = true
                print("Error: failed to download image!")
            }
        }
        let filterOp = BlockOperation {
            DispatchQueue.main.async {
                if self.rawImg == nil {
                    self.queue.cancelAllOperations()
                    print("cancel all op [@filter]")
                }else{
                    self.imgView.image = self.rawImg
                    self.task2LB.text = "viewed"
                    print("viewed")
                }
            }
        }
        filterOp.addDependency(downloadOp)
        queue.addOperations([downloadOp, filterOp], waitUntilFinished: true)
        print("Finished")
    }


}

