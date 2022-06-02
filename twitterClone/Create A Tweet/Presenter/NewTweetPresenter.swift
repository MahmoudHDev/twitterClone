//
//  NewTweetPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase
protocol NewTweetPresenterView {
    func updateProf(image:String)
    func tweetSuccess(Tweet: String)
    func tweetError(error: Error)
}
//MARK:- Presenter
class NewTweetPresenter {
    
    //MARK:- Properties
    var view: NewTweetPresenterView?
    var imageUrl : String = "https://via.placeholder.com/150.png"
    let time = Date()
    let db = Firestore.firestore()
    let dbRef = Database.database().reference()
    private weak var ref: DocumentReference? = nil
    
    //MARK:- Init
    init(view: NewTweetPresenterView) {
        self.view = view
    }
    
    //MARK:- Methods
    func userInfo() {
        guard let userID = Auth.auth().currentUser else { return }
        print(userID.uid)
        let ref = Database.database().reference()
        dbRef.child(K.collections.users).child(userID.uid).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            if let profilePhoto = value!["profilePhoto"] as? String {
                let imageURl = profilePhoto
                self.view?.updateProf(image: imageURl )
            }else{
                print("Error while fetching the profile photo")
            }
            
        }
    }
    
    func sendTweet(tweetContent: String ) {
        guard let currentUser   = Auth.auth().currentUser else {return}

        dbRef.child(K.collections.users).child(currentUser.uid).getData { (_ , dataSnapshot) in
            if let data = dataSnapshot.value as? NSDictionary {
                guard let userStr = data["username"] as? String else {return}
                guard let userImg = data["profilePhoto"] as? String else {return}
                self.ref = self.db.collection("userTweets").addDocument(data: [
                    "email" : currentUser.email ?? "",
                    "username": userStr,
                    "time": self.time,
                    "userID":currentUser.uid ,
                    "profilePhoto": userImg ,
                    "tweet":tweetContent
                ])
                print("Success From the presenter")
                self.view?.tweetSuccess(Tweet: "Document added Successfully")
            }
        }

    }
    
    
}
