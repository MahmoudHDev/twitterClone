//
//  Chat+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import UIKit

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableViewConfig() {
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
        cell.messageContent.text = "Hi This is a message"
        return cell
    }
    
    
    
}

