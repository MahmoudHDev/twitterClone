//
//  HomeViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    // Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newTweetBrn: UIButton!
    var menu: SideMenuNavigationController?
    
    
    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        // SideMenu Configuration
        updateSideMenu()
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        newTweetBrn.layer.cornerRadius = 0.5 * newTweetBrn.bounds.size.width
        newTweetBrn.clipsToBounds = true
    }
    
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        
        present(menu!, animated: true)

    }
    @IBAction func topTweetBtn(_ sender: UIBarButtonItem) {
        // Settings ViewController
        
    }
    
    @IBAction func newTweetBtn(_ sender: UIButton) {
        // to make it circular
        
    }
    func updateSideMenu(){
        menu?.leftSide = true
        // CHANGE THIS
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TweetTableViewCell {
            cell.newTweet(nameLbl: "Mahmoud", usernameLbl: "@Mahmoud", timeOfTweet: "1m", tweetContent: "Save the world!")
            
            return cell
        }
        return TweetTableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
