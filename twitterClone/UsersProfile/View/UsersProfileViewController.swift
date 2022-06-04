//
//  UsersProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/4/22.
//

import UIKit

class UsersProfileViewController: UIViewController {
    
    //MARK:- Properties
    lazy var presenter = UsersProfilePresenter(view: self)
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
    @IBOutlet weak var followBtn        :UIButton!
    @IBOutlet weak var dmBtn            :UIButton!
    var tweetInfo = Tweets()

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dmBtn.layer.cornerRadius = 0.5
        followBtn.layer.cornerRadius = 0.5
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.size.width
        profilePhoto.layer.borderWidth = 0.5
        profilePhoto.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        tableView.separatorStyle = .none
        title = "Profile"
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func profileVCButtons(_ sender: UIButton ) {
     
        switch sender.tag {
        case 0:
            print("Follow")
        case 1 :
            print("Send a message")
        default:
            print("assign a button")
        }
        
    }


}

//MARK:- Presenter

extension UsersProfileViewController: UsersProfileView {
    
    func dataDidLoad() {
        print("Data Loaded")
    }
    
    
}
