//
//  ViewController.swift
//  XIB_Demo
//
//  Created by Usef on 22/01/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: myView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        containerView.myButton.addTarget(self, action: #selector(printHello), for: .touchUpInside)
    }
    @objc func printHello(){
        print("Hello iti!")
        let tVC = self.storyboard?.instantiateViewController(withIdentifier: "table") as! MyTableViewController
        self.navigationController?.pushViewController(tVC, animated: true)
    }


}

