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
    var messageReciver = TweeterUsers()
    var presenter: ChatPresenter?
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let profileImg = UIImage(named: "twitterEgg")
        imageView.image = profileImg
        navigationItem.titleView = imageView
        messageTextfield.delegate = self
        presenter = ChatPresenter(view: self)
        presenter?.loadMessages()
        tableViewConfig()
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

    
}
//MARK:- Presenter

extension ChatViewController: ChatView {
    func messageLoaded() {
        print("Successfully sent")
        messageTextfield.text = ""
    }
    
}
