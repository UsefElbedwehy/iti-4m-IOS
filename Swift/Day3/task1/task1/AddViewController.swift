//
//  AddViewController.swift
//  task1
//
//  Created by Uef on 11/01/2025.
//

import UIKit

class AddViewController: UIViewController {
    var movieDelegete:MovieDelegete!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var ratingTextField: UITextField!
    
    @IBOutlet weak var reYearTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var imgTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func sumbitAddition(_ sender: Any) {
        let mov = Movie(title: titleTextField.text!, rating: Double(ratingTextField.text!)!, releaseYear: Int(reYearTextField.text!)!, genre: genreTextField.text!, image: imgTextField.text!)
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
