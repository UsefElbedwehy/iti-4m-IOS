//
//  MovieTableViewController.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit
import Reachability
class MovieTableViewController: UITableViewController , MovieDelegete , ConnectionDelegete {
    var movieArr = [Movie1]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavBtn()
        ConnectionHelper.connDelegete = self
        ConnectionHelper.connectionSharedInstance.start()
        
    }
    func loadData() {
        movieArr = DataBaseHelper.dBSharedInstance.fetchData()
        tableView.reloadData()
    }
    func showAlert() {
        let alert = UIAlertController(title: "Connection Failed!", message: "You are offline. Please connect to the internet to load the data.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    func addMovieToTableView(_ movObj: Movie1) {
        movieArr.removeAll()
        DataBaseHelper.dBSharedInstance.saveData(movObj)
        movieArr = DataBaseHelper.dBSharedInstance.fetchData()
        tableView.reloadData()
    }
    @objc func addMovie()  {
        let aVC = self.storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        aVC.movieDelegete = self
        self.navigationController?.pushViewController(aVC, animated: true)
    }
    func addRightNavBtn() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addMovie))
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movieArr[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dVC = self.storyboard?.instantiateViewController(identifier: "display") as! DisplayViewController
        dVC.mov = movieArr[indexPath.row]
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
