//
//  ProfileVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit
import Firebase

//MARK:- TableViewDataSource

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableViewConfiguration() {
        
        tableView.register(UINib(nibName: "TweetsProfileTableViewCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TweetsProfileTableViewCell
        let theTweets = userTweets[indexPath.row]
        if userTweets.count  > 0  {
            print("Load the user Tweets")
            // Dont forget to square the image
            cell.username.text      = theTweets.username
            cell.emain.text         = theTweets.email
            cell.tweetContent.text  = theTweets.tweet
            cell.time.text          = theTweets.time?.timesAgoDisplay()
            if let imageURL = theTweets.profilePhoto {
                ref.reference(forURL: imageURL).getData(maxSize: 1 * 1024 * 1024) { (data, _) in
                    guard let safeData = UIImage(data: data ?? Data()) else {return}
                    cell.profileImg.image = safeData
                }
            }
            
        }else{
            print("No Tweets to show")
            cell.textLabel?.text = "No tweets to show"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
