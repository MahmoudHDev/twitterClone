//
//  SearchVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if filterdUser.count > 0 {
            cell.textLabel?.text = filterdUser[indexPath.row].username
            cell.imageView?.image = UIImage(named: "twitterEgg")
        }else {
            cell.textLabel?.text = "write anything in the search bar"
        }
        print(filterdUser[indexPath.row].email ?? "" )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(filterdUser[indexPath.row].email)
    }
    
    
}
