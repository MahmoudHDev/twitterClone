//
//  TweetDetailsVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/19/22.
//

import UIKit
import Firebase
extension TweetDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetDetailsTableViewCell
        cell.delegate           = self
        cell.profTweetDetails   = tweetDetails
        cell.tweetContent.text  = tweetDetails.tweet
        cell.userName.text      = tweetDetails.username
        cell.email.text         = tweetDetails.email
        
        if let profileURL = tweetDetails.profilePhoto {
            let imagePath = storage.reference(forURL: profileURL)
            imagePath.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                guard let safeData = data else { return }
                cell.profilePhoto.image = UIImage(data: safeData)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TweetDetailsViewController: TweetDetailsTVCDelegate {
    
    func showUserData(userInfo: Tweets) {
        let storyBoard = UIStoryboard(name: "UsersProfile", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "showUsersProf") as! UsersProfileViewController
        vc.tweetInfo = userInfo
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
