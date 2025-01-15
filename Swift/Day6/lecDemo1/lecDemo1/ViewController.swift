//
//  ViewController.swift
//  lecDemo1
//
//  Created by Usef on 15/01/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadNewsData(_ sender: Any) {
        //1- URL
        let url = URL(string: "")
        //2-req
        let request = URLRequest(url: url!)
        //3-session
        let session = URLSession(configuration: .default)
        //4-task
        let task = session.dataTask(with: request) { Data, request, error in
//            do{
//                
//            }catch let error {
//                
//            }
        }
        
        //5-resume task
        task.resume()
        
        
    }
    
}

