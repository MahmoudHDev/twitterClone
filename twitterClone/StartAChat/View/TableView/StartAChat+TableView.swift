//
//  StartAChat+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit

extension StartAChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableViewConfig() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        // Reg a NIB , Cast it
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // segue ,, and don't forget about the sequence
        
    }
}
