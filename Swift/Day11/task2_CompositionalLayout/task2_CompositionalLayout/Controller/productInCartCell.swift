//
//  productInCartCell.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 26/01/2025.
//

import UIKit

class productInCartCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
