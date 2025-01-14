//
//  AddViewController.swift
//  task1
//
//  Created by Uef on 11/01/2025.
//

import UIKit

class AddViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    var movieDelegete:MovieDelegete!
    var strBase64 = String()
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var ratingTextField: UITextField!
    
    @IBOutlet weak var reYearTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var imgTextField: UITextField!
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        configPhotoLibrary()
    }
    @IBAction func sumbitAddition(_ sender: Any) {
        let mov = Movie(title: titleTextField.text!, rating: Double(ratingTextField.text!)!, releaseYear: Int(reYearTextField.text!)!, genre: genreTextField.text!, image: strBase64)
        print("==========\(strBase64)=======")
        movieDelegete.addMovieToTableView(mov)
        self.navigationController?.popViewController(animated: true)
    }
    
//    func initImgPicker() {
//        let imgPicker = UIImagePickerController()
//        imgPicker.delegate = self
//    }
    func configPhotoLibrary() {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imgPicker.sourceType = .photoLibrary
            self.present(imgPicker, animated: true, completion: nil)
        }else{
            print("photoLibrary is not available")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imgInfo = info[UIImagePickerController.InfoKey.originalImage]
        imgView.image = imgInfo as? UIImage
        let imageData:NSData = ((imgInfo as? UIImage)!).pngData()! as NSData
        strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        self.dismiss(animated: true, completion: nil)
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
