//
//  ProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameOfTheUser: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userBio: UILabel!
    @IBOutlet weak var joinedDate: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var navigateProfile: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imagePicker: UIImagePickerController!
    lazy var presenter = ProfilePresenter(view: self)
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    //MARK:- Actions
    
    @IBAction func editBtn(_ sender: Any) {
        // go to edit EditProfileVC
    }
    

}
//MARK:- Presenter

extension ProfileViewController: ProfilePresenterView {
    // Methods
}
//MARK:- TableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableViewCell.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
    
    
}
