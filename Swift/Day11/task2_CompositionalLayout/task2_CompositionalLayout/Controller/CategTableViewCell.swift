//
//  CategTableViewCell.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 25/01/2025.
//

import UIKit

class CategTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var priceLB: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
