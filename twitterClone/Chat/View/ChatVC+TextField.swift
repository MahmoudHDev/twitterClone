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
        if  messageTextfield.text != "" {
            let date = Date()
            guard let receiver = messageReciver.userID else {
                return false
            }
            presenter?.sendMessage(messageContent: textField.text!, msgReciever: receiver, date: date)
            return true
        }else{
            
            return false
        }
    }

}
