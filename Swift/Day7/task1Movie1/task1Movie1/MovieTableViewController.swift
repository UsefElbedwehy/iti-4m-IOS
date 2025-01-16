//
//  MovieTableViewController.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit

class MovieTableViewController: UITableViewController , MovieDelegete{
    var movieArr = [Movie1]()
    func addMovieToTableView(_ movObj: Movie1) {
        movieArr.removeAll()
        DataBaseHelper.dBSharedInstance.saveData(movObj)
        movieArr = DataBaseHelper.dBSharedInstance.fetchData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavBtn()
        movieArr = DataBaseHelper.dBSharedInstance.fetchData()
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
