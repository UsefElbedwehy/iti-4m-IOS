//
//  ViewController.swift
//  lec_demo2
//
//  Created by Uef on 14/01/2025.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPhotoFromLib(_ sender: UIButton) {
        let imgpicker = UIImagePickerController()
        imgpicker.delegate = self
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            imgpicker.sourceType = .camera
//            self.present(imgpicker, animated: true, completion: nil)
//        }else{
//            print("Camera is not available")
//        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imgpicker.sourceType = .photoLibrary
            self.present(imgpicker, animated: true, completion: nil)
        }else{
            print("photoLibrary is not available")
        }
    
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage]
        
        //print("\(info.values)")

        imgView.image = img as? UIImage
        let imageData:NSData = imgView.image!.pngData()! as NSData
        print("\(imageData)")
        self.dismiss(animated: true, completion: nil)
    }
}

