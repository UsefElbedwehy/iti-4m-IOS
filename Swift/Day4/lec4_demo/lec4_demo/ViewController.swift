//
//  ViewController.swift
//  lec4_demo
//
//  Created by Uef on 12/01/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        _ = DBManager.sharedResource
        _ = DBManager.sharedResource
        
    }


}

