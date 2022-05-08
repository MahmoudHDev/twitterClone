//
//  HomeViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    //MARK:- Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newTweetBrn: UIButton!
    var menu: SideMenuNavigationController?
    var arrTweets: [Tweets] = []     // empty arr of tweets
    lazy var presenter = HomePresenter(view: self)
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.readTweets()
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        // SideMenu Configuration
        updateSideMenu()
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        newTweetBrn.layer.cornerRadius = 0.5 * newTweetBrn.bounds.size.width
        newTweetBrn.clipsToBounds = true
    }
    
    //MARK:- Methods
    func updateSideMenu(){
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    //MARK:- Actions
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        
        present(menu!, animated: true)

    }
    @IBAction func topTweetBtn(_ sender: UIBarButtonItem) {
        // Settings ViewController
        
    }
    
    @IBAction func newTweetBtn(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "createATweet")
        present(vc, animated: true)
    }
}

//MARK:- Presenter
extension HomeViewController: HomePresenterView  {
    func appendTweets(TwitteContent: Tweets) {
        arrTweets.append(TwitteContent)
        print(arrTweets)
    }
    
    func tweetsError(error: Error) {
        print("Err HomeViewController :=> \(error.localizedDescription)")
    }
    
    func showTweets() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("Tweets")
    }
    
    
}
