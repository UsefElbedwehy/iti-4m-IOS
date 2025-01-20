//
//  DisplayViewController.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit
import SDWebImage
class DisplayViewController: UIViewController {
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var idLB: UILabel!
    @IBOutlet weak var yearLB: UILabel!
    @IBOutlet weak var genreLB: UILabel!
    @IBOutlet weak var ratingLB: UILabel!
    @IBOutlet weak var dirsctLB: UILabel!
    @IBOutlet weak var actorsLB: UILabel!
    @IBOutlet weak var plotsLB: UILabel!
    @IBOutlet weak var runtimeLB: UILabel!
    @IBOutlet weak var countryLB: UILabel!
    
    @IBOutlet weak var awardsLB: UILabel!
    
    @IBOutlet weak var websiteLB: UILabel!
    var selectedMovie:Movie!
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        self.navigationItem.title = NSLocalizedString("Movie", comment: "DisplayVCNavigationBarTitle")
        super.viewDidLoad()
        titleLB.text   = selectedMovie.title.uppercased()
        idLB.text      = String(selectedMovie.id)
        yearLB.text    = String(selectedMovie.year)
        genreLB.text   = selectedMovie.genre.joined(separator: ", ")
        ratingLB.text  = String(selectedMovie.rating)
        dirsctLB.text  = selectedMovie.director
        actorsLB.text  = selectedMovie.actors.joined(separator: ", ")
        plotsLB.text   = selectedMovie.plot
        runtimeLB.text = String(selectedMovie.runtime)
        countryLB.text = selectedMovie.country
        websiteLB.text = selectedMovie.website
        awardsLB.text  = selectedMovie.awards
        imgView.sd_setImage(with: URL(string: selectedMovie.poster), placeholderImage: UIImage(named: "remove.png"))
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
