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
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timeOfTweet: UILabel!
    @IBOutlet weak var tweetContent: UITextView!
    // FaveButtons
    // Notes:       FaveButtons needs an edit with the size of the image
    let faveButton = FaveButton()
    @IBOutlet weak var likeBtn   :FaveButton!
    @IBOutlet weak var shareBtn  :FaveButton!
    @IBOutlet weak var retweetBtn:FaveButton!
    @IBOutlet weak var commentBtn:FaveButton!
    
    var toggleButton = false
    
    // Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code          like the viewDidLoad

        faveButton.scalesLargeContentImage = false
        faveButton.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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

    func newTweet(nameLbl: String, usernameLbl: String,timeOfTweet: String ,tweetContent:String){
        self.nameLbl.text = nameLbl
        self.usernameLbl.text = usernameLbl
        self.timeOfTweet.text = timeOfTweet
        self.tweetContent.text = tweetContent

    }
    
}
