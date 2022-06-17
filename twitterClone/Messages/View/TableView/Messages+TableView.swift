//
//  Messages+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/17/22.
//

import UIKit
import Firebase

//MARK:- UITableView dataSource

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesTableViewCell
        if loadedUsers.count > 0 {
            let messages = mssgs[indexPath.row]
            let users    = loadedUsers[indexPath.row]
            cell.senderUsername.text = users.username ?? ""
            cell.senderMessage.text  = messages.messageContent
            if let imageURL = users.profilePhoto {
                let db = Storage.storage()
                db.reference(forURL: imageURL).getData(maxSize: 1 * 1024 * 1024) { (data, _) in
                    guard let safeData = UIImage(data: data!) else { return}
                    cell.senderImage.image = safeData
                }
            }
            
        }else {
            cell.senderMessage.text = "No Messages Yet"
            
        }        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Chat", bundle: nil).instantiateViewController(identifier: "chatID") as! ChatViewController
        self.navigationController?.pushViewController(storyBoard, animated: true)
        print("go to chat")
        
    }

}
