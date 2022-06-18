//
//  Chat+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import UIKit
import Firebase
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableViewConfig() {
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userMessages.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
        guard let userID = Auth.auth().currentUser?.uid else { return cell }
        print(userID)
        if userMessages.count > 0 {
            let messages = userMessages[indexPath.row]
            if messages.senderID == userID {
                // sender
            print("Sender: \(messages.senderID ?? ""), Receiver: \(messages.receiverID ?? "").")
                cell.imgProfile.isHidden = true
                cell.messagePop.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                cell.messageContent.text = messages.messageContent ?? ""
            }else {
                // Receiver
                print("Sender: \(messages.senderID ?? ""), Receiver: \(messages.receiverID ?? "").")
                cell.imgProfile.isHidden = false
                cell.messagePop.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                cell.messageContent.text = messages.messageContent ?? ""
            }

            
        }else{
            cell.textLabel?.text = "No Messages! "
        }
        
        return cell
    }
    
    
    
}

