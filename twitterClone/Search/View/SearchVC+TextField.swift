//
//  SearchVC+TextField.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit

extension SearchViewController: UITextFieldDelegate{

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text != "" {
            print("User is writing..")
            
        }else {
            print("Empty the array")
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchtext = searchTxtField.text! + string  // the inserted text
        if isWritten {
            
        }else {
            
        }
        let filtered = arrUsers.filter { (userTweet) -> Bool in
            (userTweet.username?.contains(searchtext) ?? false)
        }
        for user in filtered {
            filterdUser.append(user)
            print(user.username)
        }
        
        return true
    }
}
