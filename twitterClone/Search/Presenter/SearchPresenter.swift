//
//  SearchPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/4/22.
//

import Foundation
import Firebase

protocol SearchView {
    func loadUsers(users: TweeterUsers)
    func removeUsers()
}
//MARK:- Presenter
class SearchPresenter {
    
    //MARK:- Properties
    var view: SearchView?
    let ref =  Database.database().reference()
    
    //MARK:- Init
    
    init(view: SearchView) {
        self.view = view
    }
    
    //MARK:- Methods
    func loadUsers() {
        view?.removeUsers()
        // empty the array
        ref.child(K.collections.users).observe(.value) { (dataSnapShot) in
            guard let safeData = dataSnapShot.value as? NSDictionary else {return}
            let arrID = safeData.allKeys as! [String]
                self.loadUserInformation(userID: arrID)
        }
    }
    
    func loadUserInformation(userID: [String]) {
        // Empty the array in viewController
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
    
}

// Load users and append them inside an Array of users

// get all userData
// if the textField match with a specific charachters the textField should show the users

