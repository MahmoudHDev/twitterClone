//
//  ProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import Foundation
import Firebase

//MARK:- The Protocol
protocol ProfilePresenterView {
    func defaultProfile(imageProfile: UIImage)
    func errorOccured(error: String)
    func userInformation(user info: TweeterUsers)
    func loadTweets(tweets: Tweets)
    func errorLoadTweets(error: String)
    func emptyTheArray()
    
}


//MARK:- The Presenter
class ProfilePresenter {
    
    //MARK:- Properties
    var view: ProfilePresenterView?
    let db = Firestore.firestore()               // FireStore Refrence
    let date = Date()
    let dbRef = Database.database().reference() // dataBase Refrence
    let storage     = Storage.storage()         // storage init
    lazy var storageRef  = storage.reference()  // DB Ref
    
    //MARK:- Init
    
    init(view: ProfilePresenterView) {
        self.view = view
    }
    
    //MARK:- Methods
    // get userData
    func userInfo() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        guard let user = Auth.auth().currentUser else {return}
        let userRef = ref.child(K.collections.users).child(user.uid)
        userRef.observe(.value, with: { (datasnapShot) in
            guard let value = datasnapShot.value as? NSDictionary else {return}
            let username    = value["username"] as? String ?? ""
            let email       = value["email"] as? String ?? ""
            let profileImg  = value["profilePhoto"] as? String ?? K.user.profilePhoto
            let dateJ       = value["dateJoined"] as? String ?? ""
            let followers   = value["followers"] as? Int ?? 0
            let following   = value["following"] as? Int ?? 0
            let coverImg    = value["coverPhoto"] as? String ?? K.user.coverImage
            // add this to the model
            self.showUserImage(profileURL: profileImg)      // show the image by this func
            var userInfo = TweeterUsers()
            userInfo.username = username
            userInfo.email = email
            userInfo.profilePhoto = profileImg
            userInfo.dateJoined = dateJ
            userInfo.followers = followers
            userInfo.following = following
            userInfo.coverPhoto = coverImg
            self.view?.userInformation(user: userInfo)
        })
        
    }
    
    func showUserImage(profileURL: String) {
        // show the user Photo in home
        // due to any edit in the edit profile will affct on the new photo and not by the link , but by reading it from gs ur
        let imagesRef = self.storage.reference(forURL: profileURL)
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
    
    
    //MARK:- Read Tweets
    
    func readTweetsQuery(){
        print("Read tweets Query function")
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let tweetRef = db.collection(K.collections.userTweets)
//        .order(by: "time", descending: true)
        
        tweetRef.whereField("userID", isEqualTo: userID)
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

