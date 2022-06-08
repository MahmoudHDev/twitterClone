//
//  ProfileFromSearchVC.swift
//  twitterClone
//
//  Created by Mahmoud on 6/7/22.
//

import UIKit

class ProfileFromSearchVC: UIViewController {
    //MARK:- Properties

    lazy var presenter = ProfileBySearchPresenter(view: self)
    @IBOutlet weak var backBttn     : UIBarButtonItem!
    @IBOutlet weak var coverImg     : UIImageView!
    @IBOutlet weak var profileImg   : UIImageView!
    @IBOutlet weak var username     : UILabel!
    @IBOutlet weak var email        : UILabel!
    @IBOutlet weak var userBio      : UILabel!
    @IBOutlet weak var city         : UILabel!
    @IBOutlet weak var joinedDate   : UILabel!
    @IBOutlet weak var following    : UILabel!
    @IBOutlet weak var followers    : UILabel!
    @IBOutlet weak var mssgBtn      : UIButton!
    @IBOutlet weak var followBtn    : UIButton!
    @IBOutlet weak var tableView    : UITableView!
    @IBOutlet weak var segmented    : UISegmentedControl!
    var userInformtion = TweeterUsers()
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.cornerRadius = 0.5 * profileImg.bounds.size.width
        profileImg.layer.borderWidth = 0.5
        profileImg.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions

    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func profileBtns(_ sender: UIButton){
        switch sender.tag {
        case 0:
            print("Send a message!")
        case 1:
            print("follow the user!")
        default:
            print("Nothing")
        }
        
    }
    //MARK:- Methods
    
    func updateUI() {
        
        username.text   = userInformtion.username ?? "no Name"
        email.text      = userInformtion.email ?? "no Name"
        city.text       = userInformtion.city  ?? "Egypt"
        following.text   = "\(userInformtion.following ?? 0)"
        followers.text   = "\(userInformtion.followers ?? 0)"
    }

}

//MARK:- Presenter
extension ProfileFromSearchVC: ProfileFromSearchView {
    
    func loadInfo() {
        print("Load Info")
    }
    
    
}
