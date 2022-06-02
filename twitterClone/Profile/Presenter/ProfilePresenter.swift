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
    func defaultProfile(imageProfile: URL)
    func errorOccured(error: String)
    func userInformation(user info: TweeterUsers)
}
//MARK:- The Presenter
class ProfilePresenter {
    
    //MARK:- Properties
    var view: ProfilePresenterView?
    let storage     = Storage.storage()         // storage init
    lazy var storageRef  = storage.reference()
    
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
        ref.child(K.collections.users).child(user.uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else {return}
            
            let username    = value["username"] as? String ?? ""
            let email       = value["email"] as? String ?? ""
            let profileImg  = value["profilePhoto"] as? String ?? K.user.profilePhoto
            let dateJ       = value["dateJoined"] as? String ?? ""
            let followers   = value["followers"] as? Int ?? 0
            let following   = value["following"] as? Int ?? 0
            let coverImg    = value["coverPhoto"] as? String ?? K.user.coverImage
            // add this to the model
            var userInfo = TweeterUsers()
            userInfo.username = username
            userInfo.email = email
            userInfo.profilePhoto = profileImg
            userInfo.dateJoined = dateJ
            userInfo.followers = followers
            userInfo.following = following
            userInfo.coverPhoto = coverImg
            self.view?.userInformation(user: userInfo)
        }
    }
    
    
    func updateProfile() {
        let storagePath = "gs://twitterclone-5a78b.appspot.com/UserImages/defaultUserProfilePhoto/twitterEgg.png"
        let spaceRef    = storage.reference(forURL: storagePath)
        spaceRef.downloadURL { (imageURL, error) in
            if let error = error {
                self.view?.errorOccured(error: error.localizedDescription)
            }else{
                self.view?.defaultProfile(imageProfile: imageURL!)
                print(imageURL!)
            }
        }
    }
    
    
    
}
