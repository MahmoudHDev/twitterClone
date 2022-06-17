//
//  StartAChat+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit
import Firebase


extension StartAChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewConfig() {
        tableView.register(UINib(nibName: "StartAChatTableViewCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! StartAChatTableViewCell
        if filterdUser.count > 0 {
            if let imgURL = filterdUser[indexPath.row].profilePhoto {
                storage.reference(forURL: imgURL).getData(maxSize: 1 * 1024 * 1024) { (data, _) in
                    guard let safeData = UIImage(data: data!) else {return}
                    cell.imgProfile.image = safeData
                }
            }
            cell.usernameLbl.text = filterdUser[indexPath.row].username
            cell.imgProfile.image = UIImage(named: "twitterEgg")
        }
        
        print(filterdUser[indexPath.row].email ?? "" )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = filterdUser[indexPath.row]
        let storyB = UIStoryboard.init(name: "Chat", bundle: nil).instantiateViewController(identifier: "chatID") as! ChatViewController
        storyB.messageReciver = selectedUser
        self.navigationController?.pushViewController(storyB, animated: true)
    }

}
