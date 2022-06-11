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

        // Reg a NIB , Cast it
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // segue ,, and don't forget about the sequence
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue to pass the data
    }
}
