//
//  NewTweetPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase
protocol NewTweetPresenterView {
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
    func sendTweet(tweetContent: String ) {
        // Send the tweet and in case of success dissmiss the current view
        // Name  of the current user or Email, Date, image URL
        print("SendTweet Function")
//        let currentUser = Auth.auth().currentUser
        ref = self.db.collection("userTweets").addDocument(data: [
                                                            "email" : "Demo Email",
                                                            "username": "Mahmoud",
                                                            "time": time,
                                                            "profilePhoto": imageUrl,
                                                            "tweet":tweetContent]) { err in
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
