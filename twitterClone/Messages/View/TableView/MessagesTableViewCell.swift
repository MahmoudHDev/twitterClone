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
        senderImage.layer.cornerRadius  = 0.5 * senderImage.bounds.size.width
        senderImage.layer.borderWidth   = 0.5
        senderImage.layer.borderColor   = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }

}
