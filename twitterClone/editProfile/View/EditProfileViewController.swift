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
    lazy var presenter = EditProfilePresenter(view: self)
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.size.width
        presenter.readDate()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear from the EditProfileVC")
    }
    
    //MARK:- Actions
        
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        // save chagnes
        print("Saving changes")
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK:- presenter

}
extension EditProfileViewController: EditProfileView {
    
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



