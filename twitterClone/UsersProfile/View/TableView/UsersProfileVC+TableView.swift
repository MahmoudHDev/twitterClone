//
//  UsersProfileVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/4/22.
//

import UIKit
import Firebase
extension UsersProfileViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the array of the user Tweets
        return arrTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersProfileTableViewCell
        let theTweets = arrTweets[indexPath.row]
        if arrTweets.count  > 0  {
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
