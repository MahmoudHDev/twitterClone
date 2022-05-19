//
//  HomeVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import UIKit
import Kingfisher
//MARK:- TableView DataSource, and Delegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TweetTableViewCell {
            let tweets = arrTweets[indexPath.row]
            cell.newTweet(email: tweets.email, usernameLbl: tweets.username, timeOfTweet: "tweets.time", tweetContent: tweets.tweet)
            cell.profileImg.kf.setImage(with: URL(string: tweets.profilePhoto))
            return cell
        }
        return TweetTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard = UIStoryboard(name: "TweetDetails", bundle: nil)
        let tweetDetails = storyBoard.instantiateViewController(identifier: "tweetPage") as! TweetDetailsViewController
        self.navigationController!.pushViewController(tweetDetails, animated: true)
        
        
        
        //        performSegue(withIdentifier: "goToTweets", sender: self)
        
//        let storyBoard = UIStoryboard(name: "TweetDetails", bundle: nil)
//        let newVC = storyBoard.instantiateViewController(withIdentifier: "tweetPage")
//        self.definesPresentationContext = true
//        newVC.modalPresentationStyle = .overCurrentContext
//        self.present(newVC, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(segue.destination)
    }
    
}
