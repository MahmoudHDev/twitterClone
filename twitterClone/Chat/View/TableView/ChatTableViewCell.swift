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
    @IBOutlet weak var sender: UIImageView!
    @IBOutlet weak var receiver: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messagePop.layer.cornerRadius = 25
        
        messageContent.textColor = .white
        
        sender.layer.cornerRadius = 0.5 * sender.bounds.size.width
        receiver.layer.cornerRadius = 0.5 * receiver.bounds.size.width
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(selected)
        // Configure the view for the selected state
    }
    
}
