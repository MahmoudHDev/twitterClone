//
//  ProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK:- Properties
    lazy var presenter = ProfilePresenter(view: self)
    @IBOutlet weak var coverPhoto       :UIImageView!
    @IBOutlet weak var profilePhoto     :UIImageView!
    @IBOutlet weak var nameOfTheUser    :UILabel!
    @IBOutlet weak var username         :UILabel!
    @IBOutlet weak var userBio          :UILabel!
    @IBOutlet weak var joinedDate       :UILabel!
    @IBOutlet weak var followers        :UILabel!
    @IBOutlet weak var following        :UILabel!
    @IBOutlet weak var editButton       :UIButton!
    @IBOutlet weak var navigateProfile  :UISegmentedControl!
    @IBOutlet weak var tableView        :UITableView!
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.separatorStyle = .none
        title = "Profile"
        presenter.updateProfile()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // do something 
    }
    //MARK:- Actions
    
    @IBAction func editBtn(_ sender: Any) {
        // go to edit EditProfileVC
        let storyBoard = UIStoryboard(name: "EditProfile", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "editProfileID")
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- Methods
    func updateUI() {
        profilePhoto.layer.borderWidth = 1.0
        profilePhoto.layer.masksToBounds = false
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width/2
        profilePhoto.clipsToBounds = true
    }

}
//MARK:- Presenter
extension ProfileViewController: ProfilePresenterView {
    
    func defaultProfile(imageProfile: UIImage) {
        // theDefault image
        profilePhoto.image = imageProfile
    }
    
    func errorOccured(error: String) {
        print(error)
    }
    

}
