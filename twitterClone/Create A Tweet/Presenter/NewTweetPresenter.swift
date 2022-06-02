//
//  NewTweetPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase
protocol NewTweetPresenterView {
    func updateProf(image:UIImage )
    func tweetSuccess(Tweet: String)
    func tweetError(error: Error)
}
//MARK:- Presenter
class NewTweetPresenter {
    
    //MARK:- Properties
    var view: NewTweetPresenterView?
    var imageUrl : String = "https://via.placeholder.com/150.png"
    let time = Date()
    let storage = Storage.storage()
    let db = Firestore.firestore()
    let dbRef = Database.database().reference()
    private weak var ref: DocumentReference? = nil
    
    //MARK:- Init
    init(view: NewTweetPresenterView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    // load user Profile image
    
    func userInfo() {
        guard let user  = Auth.auth().currentUser else { return }
        
        dbRef.child(K.collections.users).child(user.uid).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            if let imgURL = value!["profilePhoto"] as? String {
                self.loadImage(url: imgURL)
                
            }else{
                print("Error while fetching the profile photo")
            }
        }
    }
    
    func loadImage(url: String) {
        let imagesRef = self.storage.reference(forURL: url)
            imagesRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                if let error = error {
                    print(error)
                }else{
                    print("success")
                    guard let imgData = UIImage(data: data!) else {
                        return
                    }
                            print("the image from presenter is \(imgData)")
                            self.view?.updateProf(image: imgData)
                }
            }
    }
    
    
    
    
    // Send the Tweet to DataBase
    func sendTweet(tweetContent: String ) {
        guard let currentUser   = Auth.auth().currentUser else {return}

        dbRef.child(K.collections.users).child(currentUser.uid).getData { (_ , dataSnapshot) in
            if let data = dataSnapshot.value as? NSDictionary {
                guard let userStr = data["username"] as? String else {return}
                guard let userImg = data["profilePhoto"] as? String else {return}   // Image URL
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
