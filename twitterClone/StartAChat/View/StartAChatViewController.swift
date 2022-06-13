//
//  StartAChatViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit
import Firebase
import CLTypingLabel

class StartAChatViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var searchTextField  : UITextField!
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var lblInView        : CLTypingLabel!
    @IBOutlet weak var loadingView      : UIView!
    var storage         = Storage.storage()
    var filterdUser     = [TweeterUsers]()
    var arrUsers        = [TweeterUsers]()
    var selectedUser    = TweeterUsers()
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        lblInView.text = "Start write a username..."
        lblInView.charInterval = 0.1
        let presenter = StartAChatPresenter(view: self)
        presenter.loadUsers()
        assignTheTextField()
        tableViewConfig()
    }
    
    
    //MARK:- Actions
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK:- Presenter

extension StartAChatViewController: StartAChatView {
    func loadUsers(users: TweeterUsers) {
        arrUsers.append(users)
        
    }
    
    func loadSuccessfully() {
        print("loaded Successfully")
    }
    
    
}
