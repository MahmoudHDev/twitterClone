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
    var myIndexPath: Int?
    var selectedTweet = Tweets()
    let dateFormatter = DateFormatter()
    var arrTweets: [Tweets] = []     // empty arr of tweets
    lazy var presenter = HomePresenter(view: self)
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "GMT+2") as TimeZone?
        super.viewDidLoad()
        presenter.getUserInfo()
        print("Home View did Load")
        loadTweets()      // fetch the data from network
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        // SideMenu Configuration
        updateSideMenu()
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        newTweetBrn.layer.cornerRadius = 0.5 * newTweetBrn.bounds.size.width
        newTweetBrn.clipsToBounds = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("The View of HomeVC Disappear")
    }
    
    //MARK:- Methods
    func updateSideMenu(){
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func loadTweets() {
        print("loading the tweets")
        presenter.readTweets()
    }
    //MARK:- Actions
    
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
    }
    @IBAction func topTweetBtn(_ sender: UIBarButtonItem) {
        // Settings ViewController
        
    }
    @IBAction func newTweetBtn(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "CreateATweet", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "createATweet")
        present(vc, animated: true)
    }
}

//MARK:- Presenter
extension HomeViewController: HomePresenterView  {
    func emptyTheArray() {
        //Empty the Array
        arrTweets = []
        print("The array is Empty")
    }
    
    // Presenter Succeded
    func appendTweets(TwitteContent: Tweets) {
        arrTweets.append(TwitteContent)
        tableView.reloadData()
    }
    
    // Presenter Faild
    func tweetsError(error: Error) {
        print("Err HomeViewController : => \(error.localizedDescription)")
    }
}
