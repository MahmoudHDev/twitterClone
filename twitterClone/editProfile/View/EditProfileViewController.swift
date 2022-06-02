//
//  EditProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit
import Kingfisher
class EditProfileViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet var viewInfos                 : [UIView]!
    @IBOutlet weak var coverPhoto           : UIImageView!
    @IBOutlet weak var profilePhoto         : UIImageView!
    @IBOutlet weak var changeCoverBtn       : UIButton!
    @IBOutlet weak var changeImgProfileBtn  : UIButton!
    @IBOutlet weak var removeCoverBtn       : UIButton!
    @IBOutlet weak var nameLbl              : UITextView!
    @IBOutlet weak var bioLbl               : UITextView!
    @IBOutlet weak var locationLbl          : UITextView!
    @IBOutlet weak var webSiteLbl           : UITextView!
    @IBOutlet weak var dateOBLbl            : UITextView!
    lazy var presenter  = EditProfilePresenter(view: self)
    var picker          = UIImagePickerController()
    var secPicker       = UIImagePickerController()
    
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.size.width
        presenter.readDate()
        picker.delegate = self
        picker.allowsEditing = true
        secPicker.delegate = self
        secPicker.allowsEditing = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear from the EditProfileVC")
    }
    
    //MARK:- Actions
        
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        // save chagnes
        guard let profilePhoto = profilePhoto.image else { return }
        presenter.savePhoto(theImg: profilePhoto)
        guard let username = nameLbl.text, let city = locationLbl.text else { return }
        presenter.changeData(username: username, city: city)
        self.dismiss(animated: true, completion: nil)
        print("Saving changes")
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addImageBtns(_ sender: UIButton) {
        if sender.tag == 1 {
            // profile
            picker.sourceType = .photoLibrary
            present(picker, animated: true, completion: nil)
        }else if sender.tag == 2{
            secPicker.sourceType = .photoLibrary
            present(secPicker, animated: true, completion: nil)
            // cover
        }else {
            // nothing
            
        }
    }
    
    //MARK:- presenter

}
extension EditProfileViewController: EditProfileView {
    func readImgs(profilePhotos: UIImage) {
        profilePhoto.image = profilePhotos
    }
    
    
    func readData(userInfo: TweeterUsers) {
        // update information
        let user = userInfo
        nameLbl.text        = user.username
        locationLbl.text    = user.city
        // following syntax must modify
        coverPhoto.kf.setImage(with: URL(string: user.coverPhoto!))
        profilePhoto.kf.setImage(with: URL(string: user.profilePhoto!))
        print("Profile Loaded")
    }
    
    func dataDidChange(message: String) {
        // show a snakebar to inform the user that his changes have been saved
        print("Profile Changed")
    }
    
    func dataDidNotChange(error: String) {
        
        print("Profile Didn't Change")
    }
    
    
}



