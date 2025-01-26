//
//  priceInCartCell.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 26/01/2025.
//

import UIKit

class priceInCartCell: UITableViewCell {

    @IBOutlet weak var numberOfProducts: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
