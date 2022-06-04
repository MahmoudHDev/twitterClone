//
//  TweetDetailsTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 5/19/22.
//

import UIKit
import FaveButton

protocol TweetDetailsTVCDelegate {
    func showUserData(userInfo: Tweets)
    
}

class TweetDetailsTableViewCell: UITableViewCell {
    //MARK:- Properties
    @IBOutlet weak var comment  :FaveButton!
    @IBOutlet weak var retweet  :FaveButton!
    @IBOutlet weak var like     :FaveButton!
    @IBOutlet weak var share    :FaveButton!
    @IBOutlet weak var option   :FaveButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    var delegate: TweetDetailsTVCDelegate?
    var profTweetDetails  = Tweets()
    
    //MARK:- Nib Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedMe))
        profilePhoto.isUserInteractionEnabled = true
        profilePhoto.addGestureRecognizer(tap)
        
        profilePhoto.layer.borderWidth = 0.5
        profilePhoto.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.size.width

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK:- Actions

    @IBAction func buttons(_ sender: FaveButton){
        switch sender.tag {
        case 0:
            print("Comments")
        case 1:
            print("Retweet")
        case 2:
            print("Like")
            // if the bool variable is true then increase the like with 1
            // Access to the tweet and edit the content by 1 from the data base
        case 3:
            print("Share")
        case 4:
            print("More Option")
        default:
            print("Nothing")
        }
    }
    
    @objc
    func tappedMe(){
     print("go to user profile")
        delegate?.showUserData(userInfo: profTweetDetails)
        
        print(profTweetDetails.time)
        
    }
}
