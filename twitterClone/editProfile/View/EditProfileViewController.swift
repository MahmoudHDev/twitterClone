//
//  EditProfileViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

class EditProfileViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var changeCoverBtn       : UIButton!
    @IBOutlet weak var changeImgProfileBtn  : UIButton!
    @IBOutlet weak var removeCoverBtn       : UIButton!
    @IBOutlet weak var coverPhoto           : UIImageView!
    @IBOutlet weak var profilePhoto         : UIImageView!
    @IBOutlet weak var nameLbl              : UITextView!
    @IBOutlet weak var bioLbl               : UITextView!
    @IBOutlet weak var locationLbl          : UITextView!
    @IBOutlet weak var webSiteLbl           : UITextView!
    @IBOutlet weak var dateOBLbl            : UITextView!
    @IBOutlet var viewInfos                 : [UIView]!
    lazy var presenter = EditProfilePresenter(view: self)
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear from the EditProfileVC")
    }
    //MARK:- Methods
    
    
    //MARK:- Actions
        
}
extension EditProfileViewController: EditProfileView {
    
    func dataDidChange() {
        print("Profile Changed")
    }
    
    func dataDidNotChange() {
        print("Profile Didn't Change")
    }
    
    
}
