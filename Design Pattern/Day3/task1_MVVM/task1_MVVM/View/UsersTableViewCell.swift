//
//  UsersTableViewCell.swift
//  task1_MVVM
//
//  Created by Usef on 27/01/2025.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgView: UIImageView!
    
    @IBOutlet weak var usernameLB: UILabel!
    
    @IBOutlet weak var userEmailLB: UILabel!
    
    @IBOutlet weak var userPhoneLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
