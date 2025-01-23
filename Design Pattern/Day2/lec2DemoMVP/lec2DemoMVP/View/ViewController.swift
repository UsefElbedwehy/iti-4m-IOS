//
//  ViewController.swift
//  lec2DemoMVP
//
//  Created by Usef on 23/01/2025.
//

import UIKit

protocol HomeProtocol {
    func renderToView(res: ProdectResult)
}

class ViewController: UIViewController , HomeProtocol{
    func renderToView(res: ProdectResult) {
        DispatchQueue.main.async {
            self.myLabel.text = res.products![0].title
        }
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var presenter = Presenter()
        presenter.attachView(view: self)
        presenter.getData()
        
    }


}

