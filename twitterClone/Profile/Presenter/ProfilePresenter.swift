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
//        let localURL    = URL(string: "path/to/image")
        spaceRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                self.view?.errorOccured(error: error.localizedDescription)
            }else{
                // data
                let image = UIImage(data: data!)
                self.view?.defaultProfile(imageProfile: image!)
            }
        }
    }
    
}
