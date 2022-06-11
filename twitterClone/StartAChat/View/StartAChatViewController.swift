//
//  StartAChatViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit

class StartAChatViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
    }
    
    
    //MARK:- Actions

}


//MARK:- Presenter

