//
//  Tweets.swift
//  twitterClone
//
//  Created by Mahmoud on 4/28/22.
//

import Foundation
import Firebase


struct Tweets{
    // Properties
    var time         : Date?
    var tweet        : String?
    var tweetID      : String?
    var email        : String?
    var profilePhoto : String?
    var username     : String?
    var likes        : Int?
    var retweetCounts: Int?
    var didLike      = false
    // fetching user For a tweet
    // getting user corrosponding tweet it belong to
    var tweeterUsers : TweeterUsers?
    var replyingTo   : String?
    
//    init(tweeterUsers: TweeterUsers, tweetID: String, dictionary: [String: AnyObject], tweet: String) {
//        self.tweeterUsers = tweeterUsers
//        self.tweetID = tweetID
//        self.tweet = dictionary["tweet"] as? String ?? ""
//        self.likes = dictionary["likes"] as? Int ?? 0
//        self.retweetCounts = dictionary["retweetCounts"] as? Int ?? 0
//        
//        if let replyingTo = dictionary["replyingTo"] as? String {
//            self.replyingTo = replyingTo
//        }
//    }
    
}
