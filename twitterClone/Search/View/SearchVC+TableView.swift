//
//  SearchVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let users = arrUsers[indexPath.row]
        if arrUsers.count > 0 {
            cell.textLabel?.text = users.username
            cell.imageView?.image = UIImage(named: "twitterEgg")
        }else {
            cell.textLabel?.text = "write anything in the search bar"

        }
        print(users.email ?? "" )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(arrUsers[indexPath.row])
    }
    
    
}
