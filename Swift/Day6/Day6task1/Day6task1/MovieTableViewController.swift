//
//  MovieTableViewController.swift
//  Day6task1
//
//  Created by Usef on 15/01/2025.
//

import UIKit

class MovieTableViewController: UITableViewController {
    var movieArr = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApiMovieData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    func fetchApiMovieData(){
        let indector = UIActivityIndicatorView(style: .large)
        indector.center = view.center
        indector.startAnimating()
        self.view.addSubview(indector)
        //1 - url
        let url = URL(string: "https://www.freetestapi.com/api/v1/movies")
        //2 - request
        let request = URLRequest(url: url!)
        
        //3 - session
        let session = URLSession(configuration:.default)
        //4 - task
        let task = session.dataTask(with: request) { data, response, error in
            do{
                self.movieArr = try JSONDecoder().decode([Movie].self, from: data!)
                DispatchQueue.main.async{
                    indector.stopAnimating()
                    self.tableView.reloadData()
                }
            }
            catch let error
            {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = movieArr[indexPath.row].title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dVC = self.storyboard?.instantiateViewController(identifier: "Display") as! MovieDisplayViewController
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
