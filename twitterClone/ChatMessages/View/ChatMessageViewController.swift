//
//  ChatMessageViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

class ChatMessageViewController: UIViewController {
    //MARK:- Properties
    lazy var presenter = ChatMessagesPresenter(view: self)
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var writeMsg: UITextField!
    
    
    
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    //MARK:- Actions

    @IBAction func attachImage(_ sender: UIButton) {
    }
    
    @IBAction func sendBttn(_ sender: UIButton) {
    }
    
    //MARK:- Methods

    
}

//MARK:- Presenter

extension ChatMessageViewController: ChatMessagesView {
    func messageSuccess() {
        print("reload TableView ")
    }
    
    func messageError() {
        print("Error While Connecting")
    }
    
    
}
