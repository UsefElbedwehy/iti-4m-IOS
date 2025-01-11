//
//  MovieTableViewController.swift
//  day2_task2
//
//  Created by Uef on 08/01/2025.
//

import UIKit

class MovieTableViewController: UITableViewController , MovieDelegete {
    var mov:[Movie]!
    override func viewDidLoad() {
        super.viewDidLoad()
        mov = [Movie]()
        mov.append(Movie(forTitle: "Forrest Gump", forImage: "FG.jpeg", forRating: 3.2, forRYear: 2024, forGenre: ["action","drama"]))
        mov.append(Movie(forTitle: "Inception", forImage: "IN.avif", forRating: 4.8, forRYear: 2020, forGenre: ["comedy","drama"]))
         mov.append(Movie(forTitle: "The Matrix", forImage: "TM.jpeg", forRating: 7.9, forRYear: 2018, forGenre: ["action","comedy"]))
         mov.append(Movie(forTitle: "Titanic", forImage: "TIT.avif", forRating: 4.2, forRYear: 2019, forGenre: ["drama","drama"]))
         mov.append(Movie(forTitle: "The Dark Knight", forImage: "DN2.jpeg", forRating: 8.6, forRYear: 2021, forGenre: ["action","action"]))
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addMovie))
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func addMovie() {
        let tVC = self.storyboard?.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
        tVC.myProtocol = self
        self.navigationController?.pushViewController(tVC, animated: true)
    }
    func addMovieToTable(_ movie: Movie){
        mov.append(movie)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mov.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = mov[indexPath.row].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sVC = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        sVC.movie = mov[indexPath.row]
        self.navigationController?.pushViewController(sVC, animated: true)
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
