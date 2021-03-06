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
    func defaultProfile(imageProfile: UIImage)
    func errorLoadTweets(error: String)
    func emptyTheArray()
    func loadTweets(tweets: Tweets)
}

//MARK:- Presenter

class UsersProfilePresenter {
    //MARK:- Properties
    let view: UsersProfileView?
    let storage = Storage.storage()
    let db = Firestore.firestore()
    var date = Date()
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
            readTweetsQuery(userID: userID)
        }else{
            // view User's Profile
            userProfile(userIDPro: idProf)
            readTweetsQuery(userID: idProf)
        }
        
    }
    
    // if the profile is for the current user
    
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
                
                self.loadPhoto(imgURL: profilePhoto ?? "")     // load Img
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
    
    // if the profile for another user
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
                
                self.loadPhoto(imgURL: profilePhoto ?? "")     // load Img
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
    
    
    func loadPhoto(imgURL: String){
        let imagesRef = self.storage.reference(forURL: imgURL)
        imagesRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                print("success")
                guard let imgData = UIImage(data: data!) else { return }
                        print("the image from presenter is \(imgData)")
                self.view?.defaultProfile(imageProfile: imgData)
                
            }
        }
    }
    func readTweetsQuery(userID: String){
        print("Read tweets Query function")
        let tweetRef = db.collection(K.collections.userTweets).order(by: "time", descending: false)
        
        tweetRef.whereField("userID", isEqualTo: userID).whereField("time", isLessThanOrEqualTo: date )
            .addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                self.view?.errorLoadTweets(error: err.localizedDescription)
                print("Error has been ocured while fetchin data ")
            }else {
                if let snapShotDocument = querySnapshot?.documents {
                    self.view?.emptyTheArray()
                    print("done Empty")
                    for doc in snapShotDocument {
                        let data = doc.data()
                        
                        if let email = data[K.Tweet.email] as? String,
                           let profilePhoto = data[K.Tweet.profilePhoto] as? String,
                           let userID = data["userID"] as? String,
                           let username = data[K.Tweet.username] as? String,
                           let times = data[K.Tweet.time] as? Timestamp,
                           let tweet = data[K.Tweet.tweet]as? String {
                            let newTime = Timestamp.dateValue(times)
                            let newTweets = Tweets(time: newTime(), tweet: tweet, email: email, profilePhoto: profilePhoto, username: username, userID: userID)
                            self.view?.loadTweets(tweets: newTweets)
                            print("Successfully Fetched and Appended")
                        }else{
                            print("Sorry: Error while retreiving data")
                        }
                    }
                }
            }
        }
    }

}
