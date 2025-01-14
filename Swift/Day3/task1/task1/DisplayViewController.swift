//
//  DisplayViewController.swift
//  task1
//
//  Created by Uef on 11/01/2025.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var releaseYearLB: UILabel!
    
    @IBOutlet weak var ratingLB: UILabel!
    
    @IBOutlet weak var genreLB: UILabel!
    
    
    
    var movieD : Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLB.text = movieD.title
        ratingLB.text = "\(movieD.rating)"
        genreLB.text = movieD.genre
        releaseYearLB.text = "\(movieD.releaseYear)"
        let str:String = movieD.image
        decodeTheImg(img: str)
//        imgView.image = decodeImg(img: str)
        // Do any additional setup after loading the view.
    }
    func decodeTheImg(img: String) {
        if let imageData = Data(base64Encoded: img, options: .ignoreUnknownCharacters),
                   let decodedImage = UIImage(data: imageData) {
                    imgView.image = decodedImage
                } else {
                    print("Failed to decode Base64 string.")
                }
    }
    func decodeImg(img: String) -> UIImage  {
        let dataDecoded:NSData = NSData(base64Encoded: img, options: NSData.Base64DecodingOptions(rawValue: 0))!
        return  UIImage(data: dataDecoded as Data)!
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
