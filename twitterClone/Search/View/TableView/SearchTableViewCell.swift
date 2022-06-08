//
//  SearchTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 6/8/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgProfile.layer.cornerRadius = 0.5 * imgProfile.bounds.size.width
        imgProfile.layer.borderWidth = 0.5
        imgProfile.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        usernameLbl.textColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
