//
//  ProfileVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

//MARK:- TableViewDataSource

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableViewConfiguration() {
        tableView.register(UINib(nibName: "TweetsProfileTableViewCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
//        TweetsProfileTableViewCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        let theTweets = userTweets[indexPath.row]
        if userTweets.count  > 0  {
            print("Load the user Tweets")
            
            cell.textLabel?.text = theTweets.email

        }else{
            print("No Tweets to show")
            cell.textLabel?.text = "No tweets to show"
        }
        return cell
    }
    
}
