//
//  DisplayViewController.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit

class DisplayViewController: UIViewController {
    var mov: Movie1!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imggView: UIImageView!
    
    @IBOutlet weak var ryearLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = mov.title
        ratingLabel.text = "\(mov.rating)"
        genreLabel.text = mov.genre
        ryearLabel.text = "\(mov.releaseYear)"
        imggView.image = UIImage(named: mov.image)
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
