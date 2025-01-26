//
//  CartTableViewController.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 26/01/2025.
//

import UIKit

class CartTableViewController: UITableViewController {

    var productsInCart: [Product] = [] // Initialize the array
    var totalPrice: Double = 0.0
        var totalNumberOfProducts: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        calcTotalPriceAndCounter()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func calcTotalPriceAndCounter(){
        for i in 0..<productsInCart.count {
        if let itemPrice = Double(productsInCart[i].price) {
                            totalPrice += itemPrice
                        }
            totalNumberOfProducts += productsInCart[i].counter
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0 : //products
            return productsInCart.count
        default:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! productInCartCell
            cell.imgView.image = UIImage(named: productsInCart[indexPath.row].img)
            cell.titleLabel.text = productsInCart[indexPath.row].title
            cell.price.text = productsInCart[indexPath.row].price + "$"
            cell.imgView.layer.cornerRadius = 30
            cell.imgView.layer.borderWidth  = 5
            cell.imgView.contentMode = .scaleAspectFill
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as! priceInCartCell
            cell.numberOfProducts.text = String(totalNumberOfProducts)
            cell.totalPrice.text = String(totalPrice) + "$"
            cell.backgroundColor = UIColor.systemGray6
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentCell
            return cell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
