//
//  User.swift
//  twitterClone
//
//  Created by Mahmoud on 5/22/22.
//

import Foundation
import Firebase

struct TweeterUsers {
    //MARK:- Properties
    var userID      : String?
    var username    : String?
    var email       : String?
    var dateJoined  : String?
    var profilePhoto: String?
    var coverPhoto  : String?
    var profileBio  : String?
    var city        : String?
    var followers, following : Int?
    var isFollower  = false
//    var myTweets    = Tweets()?
    
    var currentUser : Bool {
        
        return Auth.auth().currentUser?.uid == userID
    }
    
    //MARK:- Methods
    
}
struct UserRelationStats {
    var followers, following : Int
}
