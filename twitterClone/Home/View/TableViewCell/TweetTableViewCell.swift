//
//  TweetTableViewCell.swift
//  twitterClone
//
//  Created by Mahmoud on 4/25/22.
//

import UIKit
import FaveButton

class TweetTableViewCell: UITableViewCell {
    
    // Properties
    let faveButton = FaveButton()
    @IBOutlet weak var profileImg   :UIImageView!
    @IBOutlet weak var nameLbl      :UILabel!
    @IBOutlet weak var usernameLbl  :UILabel!
    @IBOutlet weak var timeOfTweet  :UILabel!
    @IBOutlet weak var tweetContent :UILabel!
    @IBOutlet weak var likeBtn      :FaveButton!
    @IBOutlet weak var shareBtn     :FaveButton!
    @IBOutlet weak var retweetBtn   :FaveButton!
    @IBOutlet weak var commentBtn   :FaveButton!
    
    var toggleButton = false
    
    //MARK:- View LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImg.layer.borderWidth = 0.5
        profileImg.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        profileImg.layer.cornerRadius = 0.5 * profileImg.bounds.size.width
        faveButton.scalesLargeContentImage = false
        faveButton.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- Actions

    @IBAction func tweetButtons(_ sender: Any) {
        // each button has to do a specific func
        
        let buttonTag = (sender as AnyObject).tag
        
        switch buttonTag {
        case 1:     // optionButton
            print("Option Key did tap")
        case 2:     // comment
            // present A viewController
            print("Commented")
        case 3:
            if toggleButton == false  {
                retweetBtn.tintColor = .green
                toggleButton = true
            }else {
                retweetBtn.tintColor = .link
                toggleButton = false
            }
            print(toggleButton)
            print("Retweeted")
        case 4:
            if toggleButton == false  {
                toggleButton = true
                print("Liked")
            }else {
                likeBtn.tintColor = .link
                likeBtn.imageView?.image = UIImage(systemName: "heart")
                toggleButton = false
                print("Unliked")
            }
            print(toggleButton)
            print("Liked")
        case 5:
            print("Shared")
        default:
            print("Default button")
        }
    }

    func newTweet(email: String, usernameLbl: String, timeOfTweet: String, tweetContent:String){
        self.nameLbl.text       = email
        self.usernameLbl.text   = usernameLbl
        self.timeOfTweet.text   = timeOfTweet
        self.tweetContent.text  = tweetContent
    }
    
}
