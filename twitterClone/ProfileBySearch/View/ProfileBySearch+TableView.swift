//
//  ProfileBySearch+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/8/22.
//

import UIKit

extension ProfileFromSearchVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "userTweets"
        return cell
    }
    
    
}
