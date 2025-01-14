//
//  ViewController.swift
//  lec_demo
//
//  Created by Uef on 14/01/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showFirstAlert(_ sender: UIButton) {
        let alert : UIAlertController = UIAlertController(title: "This is the first alert", message: "this is the first msg", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            print("OK")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
                print("Cancel")
            })
        self.present(alert, animated: true, completion: nil)
        }
    
    @IBAction func showSecondAlert(_ sender: UIButton) {
        let alert : UIAlertController = UIAlertController(title: "This is the first alert", message: "this is the first msg", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            print("OK")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
                print("Cancel")
            })
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func showThirdAlert(_ sender: UIButton) {
        let alert : UIAlertController = UIAlertController(title: "This is the first alert", message: "this is the first msg", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { action in
            print("OK")
            print(alert.textFields?.first?.text ?? "Usef")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
                print("Cancel")
            })
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

