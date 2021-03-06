//
//  HomeVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import UIKit
import Firebase

//MARK:- TableView DataSource, and Delegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTweets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetTableViewCell
        if arrTweets.count > 0 {
            let tweets = arrTweets[indexPath.row]
            let images = tweets.profilePhoto
            let date = tweets.time?.timesAgoDisplay()
            // init for the cell
            cell.newTweet(email: tweets.email ?? "E", usernameLbl: tweets.username ?? "U" , timeOfTweet: date ?? "3" , tweetContent: tweets.tweet ?? "4")
            if let newImgs = images {
                let newPath = storage.reference(forURL: newImgs)
                newPath.getData(maxSize: 1 * 1024 * 1024) { (data, err) in
                    guard let safeData = UIImage(data: data ?? Data()) else {return}
                    cell.profileImg.image = safeData
                }
                }else{
                // add a label
                print("No Tweets Available")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard = UIStoryboard(name: "TweetDetails", bundle: nil)
        let tweetDetails = storyBoard.instantiateViewController(identifier: "tweetPage") as! TweetDetailsViewController
        tweetDetails.tweetDetails = arrTweets[indexPath.row]
        self.navigationController!.pushViewController(tweetDetails, animated: true)
        
    }
    
}
