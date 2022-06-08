//
//  SearchVC+TableView.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit
import Firebase

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
        if filterdUser.count > 0 {
            let imgURL = filterdUser[indexPath.row].profilePhoto
            storage.reference(forURL: imgURL!).getData(maxSize: 1 * 1024 * 1024) { (data, _) in
                guard let safeData = UIImage(data: data!) else {return}
                cell.imgProfile.image = safeData
            }
            
            cell.usernameLbl.text = filterdUser[indexPath.row].username
            cell.imgProfile.image = UIImage(named: "twitterEgg")
            
            
            
        }else {
            cell.textLabel?.text = "write anything in the search bar"
        }
        print(filterdUser[indexPath.row].email ?? "" )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedUser = filterdUser[indexPath.row]
        performSegue(withIdentifier: "goToProfileSearch", sender: self)
//     segue ID   goToProfileSearch
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfileSearch" {
            print("show Profile search")
            let vc = ProfileFromSearchVC()
            vc.userInformtion = selectedUser
            
            print(vc.userInformtion)
        }
    }
    
}

