//
//  MessagesTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 4/28/22.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var senderUsername: UILabel!
    @IBOutlet weak var senderMessage: UILabel!
    
    //MARK:- View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
