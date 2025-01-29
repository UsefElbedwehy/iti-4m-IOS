//
//  ViewController.swift
//  mvvm
//
//  Created by Usef on 27/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    var viewM : ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewM = ViewModel()
        viewM.bindresultToViewController = { () in
            self.renderDataToView()
        }
        viewM.getDataFromModel()
    }
    func renderDataToView() {
        DispatchQueue.main.async {
            self.myLabel.text = self.viewM.finalResult[0].title
        }
    }

}

