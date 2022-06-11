//
//  UsersProfileTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit
import FaveButton
class UsersProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var like         : FaveButton!
    @IBOutlet weak var comment      : FaveButton!
    @IBOutlet weak var retweet      : FaveButton!
    @IBOutlet weak var share        : FaveButton!
    @IBOutlet weak var profileImg   : UIImageView!
    @IBOutlet weak var username     : UILabel!
    @IBOutlet weak var emain        : UILabel!
    @IBOutlet weak var time         : UILabel!
    @IBOutlet weak var tweetContent : UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImg.layer.cornerRadius = 0.5 * profileImg.bounds.size.width
        profileImg.layer.borderWidth = 0.5
        profileImg.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellButtons(sender: UIButton) {
        switch sender.tag {
        case 1:
            print("option")
        case 2:
            print("like")
        case 3:
            print("Comment")
        case 4:
            print("retweet")
        case 5:
            print("share")

        default:
            print("No Selection")
        }
    }
}
