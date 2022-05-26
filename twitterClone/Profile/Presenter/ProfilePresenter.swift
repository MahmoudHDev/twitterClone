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
