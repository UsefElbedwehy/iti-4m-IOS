//
//  TableViewCell.swift
//  task1
//
//  Created by Uef on 12/01/2025.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var leftLB: UILabel!
    
    @IBOutlet weak var rightLB: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
