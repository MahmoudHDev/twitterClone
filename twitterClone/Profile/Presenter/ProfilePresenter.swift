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
    func defaultProfile(imageProfile: UIImage)
    func errorOccured(error: String)
    func userInformation(user info: TweeterUsers)
}


//MARK:- The Presenter
class ProfilePresenter {
    
    //MARK:- Properties
    var view: ProfilePresenterView?
    let storage     = Storage.storage()         // storage init
    lazy var storageRef  = storage.reference()  // DB Ref
    
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
            self.showUserImage(profileURL: profileImg)      // show the image by this func
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
    
    func showUserImage(profileURL: String) {
        // show the user Photo in home
        // due to any edit in the edit profile will affct on the new photo and not by the link , but by reading it from gs ur
        let imagesRef = self.storage.reference(forURL: profileURL)
        imagesRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                print("success")
                guard let imgData = UIImage(data: data!) else { return }
                        print("the image from presenter is \(imgData)")
                self.view?.defaultProfile(imageProfile: imgData)
                
            }
        }

    }
    
    
}

