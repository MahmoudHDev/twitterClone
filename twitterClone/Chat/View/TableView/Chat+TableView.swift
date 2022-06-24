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
        if userMessages.count > 0 {
            if userID == userMessages[indexPath.row].fromId {
                cell.messageContent.text = userMessages[indexPath.row].mssg ?? ""
                cell.messagePop.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.0964606626)
                cell.messageContent.textColor = .black
                cell.receiver.isHidden = true
            }else{
                cell.sender.isHidden = true
                cell.messagePop.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                cell.messageContent.textColor = .white
                cell.messageContent.text = userMessages[indexPath.row].mssg ?? ""

            }
        }else {
            
        }
        return cell

    }
    
}

