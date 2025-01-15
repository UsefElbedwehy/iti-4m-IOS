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
        let indector = UIActivityIndicatorView(style: .large)
        indector.center = view.center
        indector.startAnimating()
        self.view.addSubview(indector)
        //1 - url
        let url = URL(string: "https://raw.githubusercontent.com/DevTides/NewsApi/master/news.json")
        //2 - request
        let request = URLRequest(url: url!)
        
        //3 - session
        let session = URLSession(configuration:.default)
        //4 - task
        let task = session.dataTask(with: request){ data , response , error in
            do{
                /*let json = try JSONSerialization.jsonObject(with: data!) as! [[String:String]]
                
                let dict1 = json[0]
                print("title: \(dict1["title"] ?? "...")")*/
                
                let json = try JSONDecoder().decode([News].self, from: data!)
                
                let news = json[0]
               
                DispatchQueue.main.async{
                    self.newLB.text = news.title ?? "..."
                    indector.stopAnimating()
                }
            }
            catch let error
            {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}

