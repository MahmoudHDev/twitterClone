//
//  MessagesViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu


class MessagesViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var tableView    : UITableView!
    @IBOutlet weak var writeMssgBtn : UIButton!
    var menu                        : SideMenuNavigationController?
    var presenter                   : MessagesPresenter?
    var mssgs = [MessagesInfo]()
    //MARK:- view LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MessagesPresenter(view: self)
        presenter?.loadMessages()
        tableView.separatorStyle = .none
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        updateSideMenu()
        updateUI()
    }

    //MARK:- Functions
    
    func updateSideMenu(){
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    private func updateUI() {
        writeMssgBtn.layer.cornerRadius = 0.5 * writeMssgBtn.bounds.size.width
        writeMssgBtn.layer.borderWidth = 0.5
        writeMssgBtn.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    //MARK:- Actions
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        
        present(menu!, animated: true)
    }
    
    @IBAction func writeAMessage(_ sender: UIButton) {
        // Composs a message
        let storyBoard = UIStoryboard(name: "StartAChat", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "searchForAUser")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func settingsBtn(_ sender: UIBarButtonItem) {
        // Present the settings
        
    }

    
}

//MARK:- Presenter

extension MessagesViewController: MessagesView {
    
    func messagesLoaded(messages: MessagesInfo) {
        mssgs.append(messages)
        tableView.reloadData()
    }

    
    
}
