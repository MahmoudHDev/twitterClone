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
    func readImgs(profilePhotos: UIImage)
    func readData(userInfo: TweeterUsers)
    func dataDidChange(message: String)
    func dataDidNotChange(error: String)
}

//MARK:- The Presenter
class EditProfilePresenter {
    
    //MARK:- Properties
    var view: EditProfileView?
    let ref = Database.database().reference()
    let storage = Storage.storage()
    //MARK:- Init
    init(view: EditProfileView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    func readDate() {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let ref = Database.database().reference()
        ref.child(K.collections.users).child(userID).getData { (error, dataSnapshot) in
            if let error = error {
                self.view?.dataDidNotChange(error: error.localizedDescription)
            }else{
                if let value = dataSnapshot.value as? NSDictionary {
                    guard let profileImage        = value["profilePhoto"] as? String else {return}
                    let coverImage          = value["coverPhoto"] as? String
                    let city                = value["city"] as? String
                    let username            = value["username"] as? String
                    let email               = value["email"] as? String
                    var userInfo            = TweeterUsers()
                    self.loadImage(url: profileImage)
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

    func loadImage(url: String) {
        let imagesRef = self.storage.reference(forURL: url)
        imagesRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                print("success")
                guard let imgData = UIImage(data: data!) else { return }
                        print("the image from presenter is \(imgData)")
                        self.view?.readImgs(profilePhotos: imgData)
            }
        }
    }
    
    func changeData(username: String, city: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child(K.collections.users).child(userID).updateChildValues([
            "username"      : username,
            "city"          : city
        ])
    }
    
    func savePhoto(theImg: UIImage) {
        guard let user = Auth.auth().currentUser else { return }
        theImg.jpegData(compressionQuality: 0.5)
        if let imgData = theImg.pngData() {
            // create a refrence
            let userPath = storage.reference().child(K.collections.users).child(user.email!).child("\(user.uid).png")
            // Upload the Image
            userPath.putData(imgData)
            // get the image URL
            userPath.downloadURL { (url, error) in
                guard let imgURl = url else { return }
            // save the ImageURL To the Realtime DB
                self.ref.child(K.collections.users).child(user.uid).updateChildValues(["profilePhoto": "\(imgURl)"])
            }
        }else{
            print("uploading Error")
        }
        
    }

}
