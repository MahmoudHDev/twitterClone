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

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    //MARK:- Actions
    
    @IBAction func editBtn(_ sender: Any) {
        // go to edit EditProfileVC
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
//MARK:- Presenter
extension ProfileViewController: ProfilePresenterView {
    // Methods
}
