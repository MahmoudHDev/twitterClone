//
//  SignUpView+TextViewDelegate.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import UIKit

//MARK:- TextField Delegate

extension SignUpViewController: UITextFieldDelegate {
    
    //MARK:- Methods

     func textFieldDelegate() {
        passwordFTxtField.isSecureTextEntry = false
        passwordSTxtField.isSecureTextEntry = false
        
        username.delegate           = self
        emailTxtField.delegate      = self
        emailTxtField.delegate      = self
        passwordSTxtField.delegate  = self
        passwordFTxtField.delegate  = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextFieldDidBeginEditing Function")
        
        if textField.text != "" && passwordFTxtField.text == passwordSTxtField.text{
            signUpBtn.isEnabled = true
            signUpBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7323547006, blue: 0.947804749, alpha: 1)
        }else{
            signUpBtn.isEnabled = false
            signUpBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7323547006, blue: 0.947804749, alpha: 0.5)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // the parameter of the function will be a text field
        switchBasedNextTextField(textField)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.passwordFTxtField && !self.passwordFTxtField.isSecureTextEntry {
            self.passwordFTxtField.isSecureTextEntry = true
        }
        if textField == self.passwordSTxtField && !self.passwordSTxtField.isSecureTextEntry {
            self.passwordSTxtField.isSecureTextEntry = true
        }
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        // i have created this function and it's not from the delegate
        switch textField {
        case self.username:
            self.emailTxtField.becomeFirstResponder()
        case self.emailTxtField:
            self.passwordFTxtField.becomeFirstResponder()
        case passwordFTxtField:
            self.passwordSTxtField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
    }
    


}
