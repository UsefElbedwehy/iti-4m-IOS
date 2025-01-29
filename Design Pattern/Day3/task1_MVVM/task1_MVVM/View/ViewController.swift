//
//  ViewController.swift
//  task1_MVVM
//
//  Created by Usef on 27/01/2025.
//

import UIKit
import Kingfisher
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var allUsers = [User]()
    
    var viewModel:ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = ViewModel()
        viewModel.bindresultToViewController = { () in
            self.renderToCell()
        }
        viewModel.getDataFromModel()
    }
    func renderToCell(){
        self.allUsers = self.viewModel.finalResult
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
        // using KingFisher
        let url = URL(string: allUsers[indexPath.row].image!)
        cell.userImgView.kf.setImage(with: url)
        var name = ""
        name.append(allUsers[indexPath.row].firstName!)
        name.append(" ")
        name.append(allUsers[indexPath.row].lastName!)
        name.append(" ")
        name.append(allUsers[indexPath.row].maidenName!)
        cell.usernameLB.text = name
        cell.userEmailLB.text =  allUsers[indexPath.row].email
        cell.userPhoneLB.text =  allUsers[indexPath.row].phone
        
        return cell
    }
    
    

}

