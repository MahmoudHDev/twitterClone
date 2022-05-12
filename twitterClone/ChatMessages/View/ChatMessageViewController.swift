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
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Actions

    
    
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
