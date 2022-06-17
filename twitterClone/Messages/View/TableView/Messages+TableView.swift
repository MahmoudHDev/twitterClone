//
//  Messages+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/17/22.
//

import UIKit

//MARK:- UITableView dataSource

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mssgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesTableViewCell
        if mssgs.count < 0 {
            cell.senderMessage.text = "No Messages Yet"
        }else {
            let messages = mssgs[indexPath.row]
            cell.senderUsername.text = messages.receiverID
            cell.senderMessage.text  = messages.messageContent
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Chat", bundle: nil).instantiateViewController(identifier: "chatID") as! ChatViewController
        self.navigationController?.pushViewController(storyBoard, animated: true)
        print("go to chat")
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 72
//    }
    
    
}
