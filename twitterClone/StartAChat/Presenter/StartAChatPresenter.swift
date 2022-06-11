//
//  StartAChatPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit
import Firebase

//MARK:- Protocol
protocol StartAChatView {
    func loadUsers(users :TweeterUsers)
    func loadSuccessfully()
    
}

//MARK:- Presenter
class StartAChatPresenter {

    //MARK:- Properties
    var view: StartAChatView?
    let ref = Database.database().reference()
    
    //MARK:- Init
    init(view: StartAChatView) {
        self.view = view
    }

    //MARK:- Methods
    func loadUsers() {
        ref.child(K.collections.users).observe(.value) { (dataSnapShot) in
            guard let safeData = dataSnapShot.value as? NSDictionary else {return}
            let arrID = safeData.allKeys as! [String]
            self.loadUsersInfo(userID: arrID)
        }
        view?.loadSuccessfully()
        print("Loaded")
    }
    
    func loadUsersInfo(userID: [String]) {
        for id in userID {
            ref.child(K.collections.users).child(id).observe(.value, with: { (dataSnapshot) in
                guard let safeData = dataSnapshot.value as? NSDictionary else { return }
                let username        = safeData[K.user.username] as? String
                let userID          = safeData[K.user.userID] as? String
                let email           = safeData[K.user.email] as? String
                let dateJoined      = safeData[K.user.dateJoined] as? String
                let profilePhoto    = safeData[K.user.profilePhoto] as? String
                let coverPhoto      = safeData[K.user.coverImage] as? String
                let city            = safeData[K.user.city] as? String
                let followers       = safeData[K.user.followers] as? Int
                let following       = safeData[K.user.following] as? Int
                let user = TweeterUsers(userID: userID ?? "", username: username, email: email, dateJoined: dateJoined, profilePhoto: profilePhoto, coverPhoto: coverPhoto, city: city, followers: followers, following: following)
                
                self.view?.loadUsers(users: user)
            })
        }
    }
    // Load Users
}
