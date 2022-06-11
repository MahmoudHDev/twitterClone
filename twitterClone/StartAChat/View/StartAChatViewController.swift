//
//  StartAChatViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit
import Firebase
class StartAChatViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var storage         = Storage.storage()
    var filterdUser = [TweeterUsers]()
    var arrUsers = [TweeterUsers]()
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
