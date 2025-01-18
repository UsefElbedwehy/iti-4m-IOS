//
//  MovieTableViewController.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit

class MovieTableViewController: UITableViewController , APIDelegete , ReachalbiltyDelegete , ActivityIndicatorDelegete{
    var isOnline = true
    var moviesArray = [Movie]()
    
    func retrieveMovies(_ movies: [Movie]) {
        moviesArray = movies
        DataBaseCD.sharedInstance.deleteAll()
        for movie in movies {
            DataBaseCD.sharedInstance.saveData(movie)
        }
    }
    func retrieveLocalData() {
        isOnline = false
        moviesArray.removeAll()
        moviesArray = DataBaseCD.sharedInstance.retrieveData()
        tableView.reloadData()
    }
    func reloadTableViewData() {
        isOnline = true
        tableView.reloadData()
    }
    func showAlert() {
        let alert = UIAlertController(title: "Connection Failed!", message: "You are offline. Please connect to the internet to load new data.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ""), style: .done, target: self, action: #selector(refreshData))
        APIConnectionHelper.delegete = self
        ReachabilityHelper.Delegete = self
        ActivityIndecator.delegete = self
        ReachabilityHelper.sharedInstance.start()
        self.navigationItem.title = "Movie App"
        self.navigationController?.navigationBar.barTintColor = UIColor.black
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func startIndicator() {
        ActivityIndecator.sharedInstance.indecator.center = view.center
        ActivityIndecator.sharedInstance.indecator.startAnimating()
    }
    
    func stopIndicator() {
        ActivityIndecator.sharedInstance.indecator.stopAnimating()
    }

    // MARK: - Table view data source

    @objc func refreshData(){
        //retrieveData()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = moviesArray[indexPath.row].title
        cell.textLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dVC = self.storyboard?.instantiateViewController(identifier: "display") as! DisplayViewController
        dVC.selectedMovie = moviesArray[indexPath.row]
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        header.tintColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isOnline {
            return "Online Movies"
        }else {
            return "Offline Movies"
        }
    }
    
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
