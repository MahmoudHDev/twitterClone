//
//  LoginVC+TextFieldDelegate.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import Foundation
import UIKit

//MARK:- TextField Delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
    func textFieldDelegate() {
        passwordTxtField.delegate = self
        emailTxtField.delegate    = self
    }
    
    func switchBasedNextTextField(_ textField: UITextField){
        switch textField {
        case passwordTxtField:
            self.emailTxtField.becomeFirstResponder()
        default:
            signIn.becomeFirstResponder()
            self.view.endEditing(true)
        }
    }
    
}
