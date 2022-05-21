//
//  TweetDetailsViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/14/22.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    //MARK:- Properties
    lazy var presenter = TweetDetailsPresenter(view: self)
    var tweetDetails  = Tweets()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var replyTextField: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    
    //MARK:- App LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print(tweetDetails)
        title = "Tweet"
        tableView.register(UINib(nibName: "TweetDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        self.modalPresentationStyle = .currentContext
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func replyBtn(_ sender: UIButton) {
        // send the reply to the DB
    }
    
    
}

//MARK:- The Presenter

extension TweetDetailsViewController: TweetDetailsView {
    func viewTweet() {
        print("View Tweet Details")
    }
    
    
}
