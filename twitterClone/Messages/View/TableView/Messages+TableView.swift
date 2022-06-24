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
 
        return mssgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesTableViewCell
        if mssgs.count > 0 {
                // Sender
                cell.senderUsername.text    = mssgs[indexPath.row].name
                cell.senderMessage.text     = mssgs[indexPath.row].mssg
        }else{
            cell.textLabel?.text = "No Messages yet"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedMessage = mssgs[indexPath.row]
        let storyBoard = UIStoryboard.init(name: "Chat", bundle: nil).instantiateViewController(identifier: "chatID") as! ChatViewController
        storyBoard.messageInfo = selectedMessage
        self.navigationController?.pushViewController(storyBoard, animated: true)
    }

}
