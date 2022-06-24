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
    var userMessages    = [Message]()
    var messageReciver  = TweeterUsers()
    var presenter       : ChatPresenter?
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ChatPresenter(view: self)
        tableViewConfig()
        textFieldConfig()
        title = messageReciver.username ?? "Chat"
        presenter?.currentUserInfo()
        loadMessages(id: messageReciver.userID!)
//        guard let id = user.userID else {return}
    }
    
    //MARK:- Action
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let msgTextField = messageTextfield.text {
            guard let id    = messageReciver.userID,
                  let name  = messageReciver.username else {return}
            presenter?.sendMessage(txt: msgTextField, toID: id, toName: name)
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
    
    func currentUser(user: TweeterUsers) {
        presenter?.myInfo = user
    }
    
    
    func emptyArray() {
        userMessages = []
    }
    
    func messageSent() {
        print("Message Sent to Firebase!")
        messageTextfield.text = ""
    }
    
    func messageLoaded(messages: Message) {
        userMessages.append(messages)
        tableView.reloadData()
    }
    
}
