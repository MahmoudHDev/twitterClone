//
//  EditProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import Foundation
import Firebase

//MARK:- The Protocol
protocol EditProfileView {
    func readData(userInfo: TweeterUsers)
    func dataDidChange(message: String)
    func dataDidNotChange(error: String)
}

//MARK:- The Presenter
class EditProfilePresenter {
    
    //MARK:- Properties
    var view: EditProfileView?
    
    //MARK:- Init
    init(view: EditProfileView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    // Firebase
    func readDate() {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let ref = Database.database().reference()
        ref.child(K.collections.users).child(userID).getData { (error, dataSnapshot) in
            if let error = error {
                self.view?.dataDidNotChange(error: error.localizedDescription)
            }else{
                if let value = dataSnapshot.value as? NSDictionary {
                    let profileImage        = value["profilePhoto"] as? String
                    let coverImage          = value["coverPhoto"] as? String
                    let city                = value["city"] as? String
                    let username            = value["username"] as? String
                    let email               = value["email"] as? String
                    var userInfo            = TweeterUsers()
                    userInfo.profilePhoto   = profileImage
                    userInfo.coverPhoto     = coverImage
                    userInfo.username       = username
                    userInfo.city           = city
                    userInfo.email          = email
                    print("Data Loaded for EditProfileVC")
                    self.view?.readData(userInfo: userInfo)
                }else {
                    self.view?.dataDidNotChange(error: "Error while reading the data!")
                }
            }
        }

    }
    
    func changeData(username: String?, city: String?, profileImg:String?, coverImage:String?) {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let ref = Database.database().reference()
        // if these value are kept the same so nothing is gonna change
        // due to the variables are gonna be the same values
        ref.child(K.collections.users).child(userID).updateChildValues([
            "username"      : username!,
            "city"          : city!,
            "profilePhto"   : username!,
            "coverPhoto"    : coverImage!
        ])
        
    }
    // read Data
    // change Data
    
    

}

