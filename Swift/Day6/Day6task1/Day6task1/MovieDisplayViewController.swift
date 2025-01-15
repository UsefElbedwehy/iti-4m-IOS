//
//  MovieDisplayViewController.swift
//  Day6task1
//
//  Created by Usef on 15/01/2025.
//

import UIKit
import SDWebImage
import Cosmos
class MovieDisplayViewController: UIViewController {
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var idLB: UILabel!
    @IBOutlet weak var yearLB: UILabel!
    @IBOutlet weak var genreLB: UILabel!

    @IBOutlet weak var dicLB: UILabel!
    @IBOutlet weak var actorsLB: UILabel!
    @IBOutlet weak var plotLB: UILabel!
    @IBOutlet weak var runtimeLB: UILabel!
    @IBOutlet weak var awardsLB: UILabel!
    @IBOutlet weak var countryLB: UILabel!
    @IBOutlet weak var languageLB: UILabel!
    @IBOutlet weak var boxOfficeLB: UILabel!
    @IBOutlet weak var productionLB: UILabel!
    @IBOutlet weak var websiteLB: UILabel!
    
    @IBOutlet weak var cosmosView: CosmosView!
    
    var mov = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        cosmosView.settings.updateOnTouch = false
        titleLB.text = mov.title
        idLB.text = String(mov.id)
        yearLB.text = String(mov.year)
        genreLB.text = mov.genre.joined(separator: ", ")
        dicLB.text = mov.director
        actorsLB.text = mov.actors.joined(separator: ", ")
        plotLB.text = mov.plot
        runtimeLB.text = String(mov.runtime)
        awardsLB.text = mov.awards
        countryLB.text = mov.country
        languageLB.text = mov.language
        boxOfficeLB.text = mov.boxOffice
        productionLB.text = mov.production
        websiteLB.text = mov.website
        cosmosView.rating = mov.rating
        posterImgView.sd_setImage(with: URL(string: mov.poster), placeholderImage: UIImage(named: "placeholder.png"))
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
