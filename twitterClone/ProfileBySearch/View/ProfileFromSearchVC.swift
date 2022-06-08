//
//  ProfileFromSearchVC.swift
//  twitterClone
//
//  Created by Mahmoud on 6/7/22.
//

import UIKit

class ProfileFromSearchVC: UIViewController {
    
    @IBOutlet weak var backBttn: UIBarButtonItem!
    var userInformtion = TweeterUsers()
    lazy var presenter = ProfileBySearchPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
  
}

extension ProfileFromSearchVC: ProfileFromSearchView {
    
    func loadInfo() {
        print("Load Info")
    }
    
    
}
