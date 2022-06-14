//
//  ChatViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import UIKit

class ChatViewController: UIViewController {
    //MARK:- Properties

    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat with"
        tableViewConfig()
    }
    
    //MARK:- Action

    

}
