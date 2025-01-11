//
//  ThirdViewController.swift
//  day2_task2
//
//  Created by Uef on 11/01/2025.
//

import UIKit

class ThirdViewController: UIViewController {
    var myProtocol : MovieDelegete?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var releaseYearTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sumbitMovieAddition(_ sender: Any) {
        var gArr = [String]()
        gArr.append(genreTextField.text!)
        let val = ratingTextField.text!
        
        let movie = Movie(forTitle: titleTextField.text!, forImage: imageTextField.text!, forRating: Double(val)!, forRYear: Int(releaseYearTextField.text!)!, forGenre: gArr)
        myProtocol?.addMovieToTable(movie)
        navigationController?.popViewController(animated: true)
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
