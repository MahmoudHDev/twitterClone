//
//  UsersProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/4/22.
//

import Foundation
import Firebase

//MARK:- Protocol

protocol UsersProfileView {
    func myProfileData(info: TweeterUsers)
    func userProfileData(info: TweeterUsers)
}

//MARK:- Presenter

class UsersProfilePresenter {
    //MARK:- Properties
    let view: UsersProfileView?
    
    //MARK:- initializer

    init(view: UsersProfileView) {
        self.view = view
    }
    
    //MARK:- Methods
    func loadUserData(idProf: String) {
        // get Data From FireBase
        guard let userID = Auth.auth().currentUser?.uid else {return}
        if idProf == userID {
           myProfile(myUserID: userID )
            
            print("my Profile \(userID)")
        }else{
            // view User's Profile
            userProfile(userIDPro: idProf)
            print("UserProfile \(idProf)")
        }
        
    }
    
    func myProfile(myUserID :String) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child(K.collections.users).child(myUserID).getData { (err, dataSnapshot) in
            if let error = err {
                print("Error while loading my Profile \(error)")
            }else{
                
                guard let userData = dataSnapshot.value as? NSDictionary else {return }
                    let username = userData[K.user.username] as? String
                    let profilePhoto = userData[K.user.profilePhoto] as? String
                    let coverPhoto = userData[K.user.coverImage] as? String
                    let email = userData[K.user.email] as? String
                    let city  = userData[K.user.city] as? String
                    let followers  = userData[K.user.followers] as? Int
                    let following  = userData[K.user.following] as? Int
                    let dateJoined  = userData[K.user.dateJoined] as? String
                    // number of tweets and my TWEETS , likes and reply
                
                print("Profile: \(profilePhoto), coverPhot\(coverPhoto)")
                    var userInfo = TweeterUsers()

                    userInfo.username = username
                    userInfo.profilePhoto = profilePhoto
                    userInfo.coverPhoto = coverPhoto
                    userInfo.email = email
                    userInfo.city = city
                    userInfo.followers = followers
                    userInfo.following = following
                    userInfo.dateJoined = dateJoined
                                        
                    self.view?.myProfileData(info: userInfo)
                    print("View my Profile")
            }
        }
            
        print("View my Profile")

    }       // myProfile Func
        
    func userProfile(userIDPro:String){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child(K.collections.users).child(userIDPro).getData { (err, dataSnapshot) in
            if let error = err {
                print("Error While loading user's Profile \(error)")
            }else{
                guard let userData = dataSnapshot.value as? NSDictionary else { return }
                
                let username = userData[K.user.username] as? String
                let profilePhoto = userData[K.user.profilePhoto] as? String
                let coverPhoto = userData[K.user.coverImage] as? String
                let email = userData[K.user.email] as? String
                let city  = userData[K.user.city] as? String
                let followers  = userData[K.user.followers] as? Int
                let following  = userData[K.user.following] as? Int
                let dateJoined  = userData[K.user.dateJoined] as? String
                // number of tweets and my TWEETS , likes and reply
                print("Username: \(username), location \(city)")
                var userInfo = TweeterUsers()
                userInfo.username = username
                userInfo.profilePhoto = profilePhoto
                userInfo.coverPhoto = coverPhoto
                userInfo.email = email
                userInfo.city = city
                userInfo.followers = followers
                userInfo.following = following
                userInfo.dateJoined = dateJoined
                                    
                self.view?.userProfileData(info: userInfo)
            }
        }
        print("viewing user's Profile")

    }       // userProfile Func
    
}


/*
 Long Comment
 
 guard let userData = dataSnapshot.value as? NSDictionary else {return }
     guard let username = userData[K.user.username] as? String else {return}
     guard let profilePhoto = userData[K.user.profilePhoto] as? String else {return}
     guard let coverPhoto = userData[K.user.coverImage] as? String else {return}
     guard let email = userData[K.user.email] as? String else {return}
     guard let city  = userData[K.user.city] as? String else {return}
     guard let followers  = userData[K.user.followers] as? Int else {return}
     guard let following  = userData[K.user.following] as? Int else {return}
     guard let dateJoined  = userData[K.user.dateJoined] as? String else {return}
     // number of tweets and my TWEETS , likes and reply
 
 print("Profile: \(profilePhoto), coverPhot\(coverPhoto)")
     var userInfo = TweeterUsers()

     userInfo.username = username
     userInfo.profilePhoto = profilePhoto
     userInfo.coverPhoto = coverPhoto
     userInfo.email = email
     userInfo.city = city
     userInfo.followers = followers
     userInfo.following = following
     userInfo.dateJoined = dateJoined
                         
     self.view?.myProfileData(info: userInfo)
     print("View my Profile")
 */
