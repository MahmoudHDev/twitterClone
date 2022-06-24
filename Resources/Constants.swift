//
//  Constants.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import Foundation


struct K {
    
    static let appName = "Twitter"
    static let cellNibName      = "MessagePopTableViewCell"
    static let cellIdentifier   = "cell"
    
    struct collections {
        static let userTweets = "userTweets"
        static let users  = "users"
    }
    
    struct user {
        static let userID           = "userID"
        static let city             = "city"
        static let username         = "username"
        static let email            = "email"
        static let profilePhoto     = "profilePhoto"
        static let dateJoined       = "dateJoined"
        static let coverImage       = "https://via.placeholder.com/250"
        static let time             = "time"
        static let following        = "following"
        static let followers        = "followers"
        
    }
    struct Tweet{
        static let username         = "username"
        static let tweet            = "tweet"
        static let email            = "email"
        static let profilePhoto     = "profilePhoto"
        static let defaultProfile   =  "https://firebasestorage.googleapis.com:443/v0/b/twitterclone-5a78b.appspot.com/o/UserImages%2FdefaultUserProfilePhoto%2FtwitterEgg.png?alt=media&token=d68b1e7c-1abd-44b0-88d1-cb54c1b121de"
        static let time             = "time"
    }
    
    struct FStore {
        /*
        static let senderName        = "senderName"
        static let senderID          = "senderID"
        static let date              = "time"
        static let messageContent    = "messageContent"
        static let receiverID        = "receiverID"
        */
        static let mssgCollection = "messages"
        static let fromId = "fromId"
        static let toId = "toId"
        static let mssg = "mssg"
        static let time = "time"
        
    }
}
