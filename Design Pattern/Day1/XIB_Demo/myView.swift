//
//  myView.swift
//  XIB_Demo
//
//  Created by Usef on 22/01/2025.
//

import UIKit

class myView: UIView {

    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myLabel: UIButton!
    
    @IBOutlet var myView: UIView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup(){
        Bundle.main.loadNibNamed("myView", owner: self, options: nil)
        addSubview(myView)
        myView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        myView.frame = self.bounds
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
