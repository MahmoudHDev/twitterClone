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
            cell.messageContent.text = userMessages[indexPath.row].mssg ?? ""
        }else {
            
        }
        return cell

    }
    
}

