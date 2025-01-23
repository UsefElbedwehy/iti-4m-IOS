//
//  ViewController.swift
//  lec2Demo
//
//  Created by Usef on 23/01/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var products : [Product]?
        let service : NetworkProtocol = Service()
        service.fetchDataFromJson { [weak self] res in
            products = (res?.products)!
            DispatchQueue.main.async {
                self?.myLabel.text = products![0].title
            }
        }
    }


}

