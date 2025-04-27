//
//  ViewController.swift
//  Task2_CombineDotAssign
//
//  Created by Usef on 05/02/2025.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func assignBtn(_ sender: UIButton) {
        let publisher = Just(titleTextField.text)
            .map({ "say: \($0 ?? "")" })
            .assign(to: \.text, on: titleLB)
    }
    
}

