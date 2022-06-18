//
//  ChatViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import UIKit

class ChatViewController: UIViewController {
    //MARK:- Properties

    @IBOutlet weak var sendBtn          : UIButton!
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var messageTextfield : UITextField!
    
    var user            = TweeterUsers()
    var userMessages    = [MessagesInfo]()
    var messageReciver  = TweeterUsers()
    var presenter       : ChatPresenter?
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ChatPresenter(view: self)
        print(messageReciver.userID ?? "")
        guard let id = user.userID else {return}
        loadMessages(id: id)
        tableViewConfig()
        textFieldConfig()
    }
    
    //MARK:- Action
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let receiver = messageReciver.userID else {return}
        if let msgTextField = messageTextfield.text {
            let date = Date()
            presenter?.sendMessage(messageContent: msgTextField, msgReciever: receiver, date: date)
        }else {
            print("Write anything to send")
        }
    }


    //MARK:- Action

    func updateUI() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let profileImg = UIImage(named: "twitterEgg")
        imageView.image = profileImg
        navigationItem.titleView = imageView
    }
    
    //MARK:- Functions
    func loadMessages(id: String) {
        presenter?.loadMessages(id: id)
        
    }
    
}
//MARK:- Presenter

extension ChatViewController: ChatView {
    
    // Empty the array
    func emptyArray() {
        
    }
    
    func errorWhileLoading(error: String) {
        print(error)
    }
    
    func messageLoaded(messages: MessagesInfo) {
        messageTextfield.text = ""
        userMessages.append(messages)
        tableView.reloadData()
    }
    
}
