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
    func appendTweets(TwitteContent: Tweets)
    func emptyTheArray()
    func tweetsError(error: Error)
}

//MARK:- Home Presenter
class HomePresenter {
    
    //MARK:- Properties
    private weak var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var view: HomePresenterView?
    
    //MARK:- Init
    init(view: HomePresenterView) {
        self.view = view
    }
    //MARK:- Methods
    
    func getUserInfo() {
        print(Auth.auth().currentUser?.email!)
        
        print(Auth.auth().currentUser?.uid)
    }
    
    func readTweets(){
        // getDocuments             For only one time
        // addSnapshotListener      for real time updates
        // Read data by Firestore
        db.collection("userTweets").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                self.view?.tweetsError(error: err)
                print("Error has been ocured while fetchin data ")
            }else {
                if let snapShotDocument = querySnapshot?.documents {
                    self.view?.emptyTheArray()
                    print("done Empty")
                    // empty the array
                    for doc in snapShotDocument {
                        let data = doc.data()
                        if let email = data[K.Tweet.email] as? String,
                           let profilePhoto = data[K.Tweet.profilePhoto] as? String,
                           let username = data[K.Tweet.username] as? String,
                           let time = data[K.Tweet.time] as? Timestamp,
                           let tweet = data[K.Tweet.tweet]as? String {
                            // we need to put the variables into thier places in class
                            let newTweets = Tweets(time: "time", tweet: tweet, email: email, profilePhoto: profilePhoto, username: username)
                            self.view?.appendTweets(TwitteContent: newTweets)
                            print("Successfully Fetched and Appended")
                        }else{
                            print("Sorry: Error during fetching the data")
                        }
                        
                    }
                }
            }
        }
    }       // END IF
}
