//
//  loginPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase
//MARK:- Home Protocol

protocol HomePresenterView {
    func emptyUsersArr()
    func appendTweets(TwitteContent: Tweets)
    func emptyTheArray()
    func tweetsError(error: Error)
}
//MARK:- Home Presenter
class HomePresenter {
    
    //MARK:- Properties
    private weak var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    let dbRef = Database.database().reference()
    let storage = Storage.storage()
    let date = Date()
    var view: HomePresenterView?
    
    //MARK:- Init
    init(view: HomePresenterView) {
        self.view = view
    }
    
    
    //MARK:- Methods
    func readTweets(){
        let tweetRef = db.collection(K.collections.userTweets)
        
        tweetRef.addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                self.view?.tweetsError(error: err)
                print("Error has been ocured while fetchin data ")
            }else {
                if let snapShotDocument = querySnapshot?.documents {
                    
                    self.view?.emptyTheArray()
                    print("done Empty")
                    for doc in snapShotDocument {
                        let data = doc.data()
                        
                        if let email = data[K.Tweet.email] as? String,
                           let profilePhoto = data[K.Tweet.profilePhoto] as? String,
                           let userID       = data["userID"] as? String,
                           let username = data[K.Tweet.username] as? String,
                           let times = data[K.Tweet.time] as? Timestamp,
                           let tweet = data[K.Tweet.tweet]as? String {
                            let newTime = Timestamp.dateValue(times)
                            let newTweets = Tweets(time: newTime(), tweet: tweet, email: email, profilePhoto: profilePhoto, username: username, userID: userID)
//                            self.view?.appendTweets(TwitteContent: newTweets)

                            print("Successfully Fetched and Appended")
                            
                        }else{
                            print("Sorry: Error while retreiving data")
                        }
                    }
                }
            }
        }
    }       // END IF

    
    func readTweetsQuery(){
        let tweetRef = db.collection(K.collections.userTweets)
        
        tweetRef.whereField("time", isLessThanOrEqualTo: date).getDocuments { (querySnapshot, err) in
            if let err = err {
                self.view?.tweetsError(error: err)
                print("Error has been ocured while fetchin data ")
            }else {
                if let snapShotDocument = querySnapshot?.documents {
                    
                    self.view?.emptyTheArray()
                    print("done Empty")
                    for doc in snapShotDocument {
                        let data = doc.data()
                        
                        if let email = data[K.Tweet.email] as? String,
                           let profilePhoto = data[K.Tweet.profilePhoto] as? String,
                           let userID       = data["userID"] as? String,
                           let username = data[K.Tweet.username] as? String,
                           let times = data[K.Tweet.time] as? Timestamp,
                           let tweet = data[K.Tweet.tweet]as? String {
                            let newTime = Timestamp.dateValue(times)
                            let newTweets = Tweets(time: newTime(), tweet: tweet, email: email, profilePhoto: profilePhoto, username: username, userID: userID)
                            self.view?.appendTweets(TwitteContent: newTweets)

                            print("Successfully Fetched and Appended")
                            
                        }else{
                            print("Sorry: Error while retreiving data")
                        }
                    }
                }
            }
        }
    }       // END IF
    
}
