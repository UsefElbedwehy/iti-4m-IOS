//
//  AddViewController.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var ratingTF: UITextField!
    
    @IBOutlet weak var rYearTF: UITextField!
    
    @IBOutlet weak var genreTF: UITextField!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var imgTF: UITextField!
    
    var movieDelegete:MovieDelegete!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitMovie(_ sender: Any) {
        let mov = Movie1(title: titleTF.text!, rating: Double(ratingTF.text!)!, releaseYear: Int(rYearTF.text!)!, genre: genreTF.text!, image: imgTF.text!)
        movieDelegete.addMovieToTableView(mov)
        self.navigationController?.popViewController(animated: true)
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
