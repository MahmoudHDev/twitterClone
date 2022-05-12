//
//  ProfileVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import UIKit

//MARK:- TableViewDataSource

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Test"
        // show user tweets
        return cell
    }
    
}
