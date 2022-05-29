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
        ref.child(K.collections.users).child(userID.uid).observeSingleEvent(of: .value) { (snapshot) in
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
        guard let currentUser = Auth.auth().currentUser else {return}
        
        ref = self.db.collection("userTweets").addDocument(data: [
            "email" : currentUser.email ?? "",
            "username": currentUser.email ?? "",
            "time": time,
            "userID":currentUser.uid ,
            "profilePhoto": imageUrl,
            "tweet":tweetContent
            ]) { err in
                if let err = err {
                    print("Error From the presenter")
                    self.view?.tweetError(error: err)
                }else{
                    print("Success From the presenter")
                    self.view?.tweetSuccess(Tweet: "Document added Successfully")
                }
        }
    }


}
