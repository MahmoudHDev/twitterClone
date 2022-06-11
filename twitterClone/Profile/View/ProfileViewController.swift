//
//  ProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit
import Firebase

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
    @IBOutlet weak var compossAtweet    :UIButton!
    var ref = Storage.storage()
    var userInfor =  TweeterUsers()
    var userTweets    = [Tweets]()
    
    //MARK:- App LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        photoConfig()
        tableViewConfiguration()
        presenter.userInfo()
        presenter.readTweetsQuery()

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
    
    @IBAction func writeATweet(_ sender: UIButton){
        let storyBoard = UIStoryboard(name: "CreateATweet", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "createATweet")
        present(vc, animated: true)
    }
    
    //MARK:- Methods
    func photoConfig() {
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.size.width
        profilePhoto.layer.borderWidth = 0.5
        profilePhoto.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        compossAtweet.layer.cornerRadius = 0.5 * compossAtweet.bounds.size.width
        compossAtweet.clipsToBounds = true
    }
    
    func loadInfo() {
        title               = userInfor.username!
        nameOfTheUser.text  = userInfor.username!
        username.text       = userInfor.username!
        joinedDate.text     = userInfor.dateJoined!
        followers.text      = String(userInfor.followers!)
        following.text      = String(userInfor.following!)
        profilePhoto.kf.setImage(with: URL(string: userInfor.profilePhoto!))
    }

}
//MARK:- Presenter
extension ProfileViewController: ProfilePresenterView {

    
    func loadTweets(tweets: Tweets) {
        userTweets.append(tweets)
        tableView.reloadData()
    }
    
    func emptyTheArray() {
        userTweets.removeAll()
    }
    func errorLoadTweets(error: String) {
        print(error)
    }
    
    func defaultProfile(imageProfile: UIImage) {
        profilePhoto.image = imageProfile
    }
    
    func errorOccured(error: String) {
        print(error)
    }
    
    func userInformation(user info: TweeterUsers) {
        print("Show user information")
        userInfor = info
        loadInfo()
    }

}
