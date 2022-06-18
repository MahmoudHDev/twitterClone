//
//  ChatTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var messagePop: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messagePop.layer.cornerRadius = 10
        messagePop.layer.masksToBounds = false
        messagePop.layer.borderWidth = 0.5
        messagePop.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        messageContent.textColor = .white
        
        imgProfile.layer.cornerRadius = 0.5 * imgProfile.bounds.size.width
        imgProfile.layer.borderWidth = 0.5
        imgProfile.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(selected)
        // Configure the view for the selected state
    }
    
}
