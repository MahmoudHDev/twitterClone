//
//  SearchViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu
class SearchViewController: UIViewController {
    //MARK:- Properties

    lazy var presenter                  = SearchPresenter(view: self)
    var menu                            : SideMenuNavigationController?
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var searchTxtField   : UITextField!
    var arrUsers = [TweeterUsers]()     // usernames, emails
    var filterdUser = [TweeterUsers]()
    var isWritten = false
    var selectedUser = TweeterUsers()
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
        print(users.username)
    }
    
    
}
