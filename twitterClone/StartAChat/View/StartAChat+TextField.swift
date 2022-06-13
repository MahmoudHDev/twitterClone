//
//  StartAChat+TextField.swift
//  twitterClone
//
//  Created by Mahmoud on 6/11/22.
//

import UIKit

extension StartAChatViewController: UITextFieldDelegate {
    
    func assignTheTextField() {
        searchTextField.becomeFirstResponder()
        searchTextField.delegate     = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            loadingView.isHidden = false
            filterdUser.removeAll()
            tableView.reloadData()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchtext = searchTextField.text! + string  // the inserted text
        if textField.text != "" {       // it keeps refreshing whenever user writting
            loadingView.isHidden = true
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
