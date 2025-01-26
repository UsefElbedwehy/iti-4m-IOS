//
//  DisplayViewController.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 25/01/2025.
//

import UIKit

class DisplayViewController: UIViewController {

    var titleToShow:String!
    var priceToShow:String!
    var imageToShow:String!
    var descToShow:String!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = titleToShow
        imgView.image =  UIImage(named: imageToShow)
        priceLabel.text = priceToShow + "$"
        descripLabel.text = descToShow
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.init(red: 19/256, green: 122/256, blue: 99/256, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "menu", style: .done, target: self, action: #selector(back))
        // Do any additional setup after loading the view.
    }
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
