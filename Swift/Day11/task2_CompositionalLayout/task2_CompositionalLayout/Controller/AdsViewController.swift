//
//  AdsViewController.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 26/01/2025.
//

import UIKit

class AdsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var urlStr : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(NSURLRequest(url: NSURL(string: urlStr)! as URL) as URLRequest)
        // Do any additional setup after loading the view.
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
