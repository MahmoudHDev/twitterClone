//
//  SearchViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu
import Firebase

class SearchViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var searchTxtField   : UITextField!
    lazy var presenter                  = SearchPresenter(view: self)
    var storage         = Storage.storage()
    var arrUsers        = [TweeterUsers]()
    var filterdUser     = [TweeterUsers]()
    var isWritten       = false
    var selectedUser    = TweeterUsers()
    var menu : SideMenuNavigationController?

    //MARK:- view LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadUsers()
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle    = .none
        searchTxtField.delegate     = self
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        updateSideMenu()
    }
    //MARK:- Methods
    
    
    //MARK:- Actions
    
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
        
    }
    
    @IBAction func settingsBtn(_ sender: UIBarButtonItem) {
        print("Settings")
    }
    
    func updateSideMenu(){
        menu?.leftSide = true
        // CHANGE THIS
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
}
//MARK:- Presenter

extension SearchViewController: SearchView {
    
    func removeUsers() {
        arrUsers.removeAll()
    }
    
    func loadUsers(users: TweeterUsers) {
        arrUsers.append(users)
        tableView.reloadData()
    }
    
    
}
