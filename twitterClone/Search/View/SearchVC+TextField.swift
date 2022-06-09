//
//  SearchVC+TextField.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit

extension SearchViewController: UITextFieldDelegate{

    func assignTheTextField() {
        searchTxtField.becomeFirstResponder()
        searchTxtField.delegate     = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            filterdUser.removeAll()
            tableView.reloadData()
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchtext = searchTxtField.text! + string  // the inserted text
        if textField.text != "" {       // it keeps refreshing whenever user writting
            
            filterdUser.removeAll()
            let filtered = arrUsers.filter { (userTweet) -> Bool in
                (userTweet.username?.contains(searchtext) ?? false)
            }
            for user in filtered {
                filterdUser.append(user)
                print(user.username!)
            }
            tableView.reloadData()
            print("Search for a user")
        }else{
            filterdUser.removeAll()
            tableView.reloadData()
            print("Empty the array")

        }
        return true
    }
}
