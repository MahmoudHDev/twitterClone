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
        // Don't forget the order
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToProf", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nav = segue.destination as? UINavigationController, let vc = nav.topViewController as? ProfileFromSearchVC {
            vc.userInformtion = selectedUser
            print("Success")
            
        }
        
    }
    
}
