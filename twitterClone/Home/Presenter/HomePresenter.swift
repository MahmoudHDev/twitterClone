//
//  loginPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase
protocol HomePresenterView {
    func showTweets()
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
    // read Tweets from the database
    // reload tableView data
    // show errors
    
    func readTweets(){
        // Read data by Firestore
        db.collection("userTweets").getDocuments() { (querySnapshot, err) in
            if let err = err {
                self.view?.tweetsError(error: err)
                print("Error has been ocured while fetchin data ")
            }else {
                for document in querySnapshot!.documents {
                    self.view?.showTweets()
                    print("\(document.documentID), => \(document.data())")
                }
            }
        }
    }

}
