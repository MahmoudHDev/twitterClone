//
//  ChatVC+TextField.swift
//  twitterClone
//
//  Created by Mahmoud on 6/14/22.
//

import UIKit

extension ChatViewController: UITextFieldDelegate {
   
    func textFieldConfig() {
        messageTextfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = messageTextfield.text {
            guard let username = messageReciver.username,
                  let id = messageReciver.userID else {return false}
            presenter?.sendMessage(txt: text, toID: id, toName: username)
            return true
        }else{
            return false
        }
    }

}
