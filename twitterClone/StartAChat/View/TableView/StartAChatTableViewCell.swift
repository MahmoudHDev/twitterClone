//
//  StartAChatTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit


class StartAChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile   : UIImageView!
    @IBOutlet weak var usernameLbl  : UILabel!
    @IBOutlet weak var greenView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("Cell Has been initialezed")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
