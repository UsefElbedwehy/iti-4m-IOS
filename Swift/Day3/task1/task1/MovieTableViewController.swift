//
//  MovieTableViewController.swift
//  task1
//
//  Created by Uef on 11/01/2025.
//
// resources: https://stackoverflow.com/questions/65651573/use-existing-sqlite-db-in-swift
// and : https://medium.com/@emre.deniz/ios-swift-sqlite3-integration-1b3dece47b46
// https://stackoverflow.com/questions/65651573/use-existing-sqlite-db-in-swift
// img: https://stackoverflow.com/questions/44780937/storing-and-retrieving-image-in-sqlite-with-swift
import UIKit

class MovieTableViewController: UITableViewController , MovieDelegete {
    var movieArr = [Movie]()
    func addMovieToTableView(_ movie: Movie) {
        DBManager.dBMangerSharedInstance.insertMovie(movie)
        movieArr.append(movie)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initMovieArr()
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addMovie))
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let mov = Movie(title: "Inception", rating: 8.4, releaseYear: 2010 , genre: "Action", image: "MR.jpeg")
//        DBManager.dBMangerSharedInstance.updateMovie(movie: mov)
        movieArr = DBManager.dBMangerSharedInstance.getAllMovies()
        for movie in movieArr {
                print("Movie: \(movie.title)")
            }
    }
                              
    @objc func addMovie()  {
        let aVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as! AddViewController
        aVC.movieDelegete = self
        self.navigationController?.pushViewController(aVC, animated: true)
    }
//    func initMovieArr()  {
//        movieArr.append(Movie(title: "MR Robot", rating: 9.2, releaseYear: 2022, genre: "Drama", image: "MRR2.jpeg"))
//        movieArr.append(Movie(title: "FAst and Furious", rating: 7.3, releaseYear: 2002, genre: "Action", image: "FAF.jpeg"))
//        movieArr.append(Movie(title: "RED 2", rating: 8.8, releaseYear: 2023, genre: "Comedy", image: "RED.jpeg"))
//        movieArr.append(Movie(title: "The Transformers", rating: 5.7, releaseYear: 2021, genre: "Horror", image: "TRANS.jpeg"))
//        movieArr.append(Movie(title: "The Transporter", rating: 6.5, releaseYear: 2001, genre: "Romance", image: "TP.jpeg"))
//    }

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
        let dVC = self.storyboard?.instantiateViewController(identifier: "displayVC") as! DisplayViewController
        dVC.movieD = movieArr[indexPath.row]
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
