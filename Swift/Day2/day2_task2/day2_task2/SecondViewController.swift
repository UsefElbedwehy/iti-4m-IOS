//
//  SecondViewController.swift
//  day2_task2
//
//  Created by Uef on 08/01/2025.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var movTitleLB: UILabel!
    @IBOutlet weak var movImageView: UIImageView!
    @IBOutlet weak var movRatingLB: UILabel!
    @IBOutlet weak var releaseYearLB: UILabel!
    @IBOutlet weak var genreLB: UILabel!
    var movie : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            movTitleLB.text = movie.title
            movImageView.image = UIImage(named: movie.image)
            movRatingLB.text = String(movie.rating)
            releaseYearLB.text = String(movie.realeaseYear)
            if !movie.genre.isEmpty {
                            genreLB.text = movie.genre.joined(separator: ", ")
                        }
        }
        // Do any additional setup after loading the view.
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
