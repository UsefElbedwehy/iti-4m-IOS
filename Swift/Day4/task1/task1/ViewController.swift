//
//  ViewController.swift
//  task1
//
//  Created by Uef on 12/01/2025.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var imgArr        = ["apple.png","android.png","twitter.png","github.png","pinterest.png"]
    var leftLabelArr  = ["Apple"    ,"Android"    ,"Twitter"    ,"Github"    ,"Pinterest"]
    var rightLabelArr = ["iOS"      ,"OS"         ,"Social"     ,"Git remote","Gallery"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.leftLB.text  = leftLabelArr[indexPath.row]
        cell.rightLB.text = rightLabelArr[indexPath.row]
        cell.imgView.image = UIImage(named: imgArr[indexPath.row])
        
        return cell
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

