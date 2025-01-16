//
//  ViewController.swift
//  lecDemo
//
//  Created by Usef on 16/01/2025.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var rYearTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: UIButton) {
        //1
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
    
        let manager: NSManagedObjectContext = appDelegete.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: manager)!
        let movie = NSManagedObject(entity: entity, insertInto: manager)
        movie.setValue(titleTF.text, forKey: "title")
        movie.setValue(Float(ratingTF.text ?? "0.0"), forKey: "rating")
        movie.setValue(Int(rYearTF.text ?? "0"), forKey: "releaseYear")
                        
        do{
            try manager.save()
            print("saved")
        }catch let error as NSError{
            print(error)
        }
        
    }
    
    @IBAction func fetch(_ sender: UIButton) {
        
    }
}

