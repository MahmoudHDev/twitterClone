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
 
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesTableViewCell
        cell.senderUsername.text = "Text"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         selectedUser = loadedUsers[indexPath.row]
         let receiverMsg = mssgs[indexPath.row].receiverID!
         guard let userID = Auth.auth().currentUser?.uid else {return}
         print("receiver tapped: \(mssgs[indexPath.row].receiverID!) ,Sender tapped: \(mssgs[indexPath.row].senderID!)")
         print(userID)
         
         let storyBoard = UIStoryboard.init(name: "Chat", bundle: nil).instantiateViewController(identifier: "chatID") as! ChatViewController
         storyBoard.messageReciver.userID = receiverMsg
         storyBoard.user = selectedUser //edited
         self.navigationController?.pushViewController(storyBoard, animated: true)
         print("go to chat")
         
         */
        
    }

}
