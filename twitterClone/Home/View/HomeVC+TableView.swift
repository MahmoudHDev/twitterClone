//
//  HomeVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import UIKit

//MARK:- TableView DataSource, and Delegate

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
