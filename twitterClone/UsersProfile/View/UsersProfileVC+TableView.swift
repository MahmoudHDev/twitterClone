//
//  UsersProfileVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/4/22.
//

import UIKit

extension UsersProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        
        return cell
    }
    
    
}
