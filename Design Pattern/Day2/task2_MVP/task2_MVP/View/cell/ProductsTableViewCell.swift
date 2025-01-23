//
//  ProductsTableViewCell.swift
//  task2_MVP
//
//  Created by Usef on 23/01/2025.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    
    @IBOutlet weak var titleLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
