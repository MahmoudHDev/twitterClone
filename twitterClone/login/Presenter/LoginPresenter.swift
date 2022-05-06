//
//  LoginPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/5/22.
//

import Foundation
import Firebase
protocol LoginPresenterProtocol: NSObjectProtocol {
    
    func login(email: String, password: String)
    func showError(error: String)
}

class LoginPresenter {
    //MARK:- Properties
    private weak var view: LoginPresenterProtocol?
    
    //MARK:- Init
    init(view: LoginPresenterProtocol) {
        self.view = view
    }

    //MARK:- Methods

    func login(email: String, password: String) {
        // fetch the data
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let er = error as NSError? {
                switch AuthErrorCode(rawValue: er.code) {
                case .operationNotAllowed:
                    print("Emails and accounts are not enabled")
                case .userDisabled:
                    print("the user account has been disabled")
                case .wrongPassword:
                    print("The passwrod is invalid")
                case .invalidEmail:
                    print("the email is malformed")
                default:
                    print(" the localized Error --> \(er.localizedDescription)")
                    self.view?.showError(error: er.localizedDescription)
                }
            }else{
                // Array that contains the user
                print("Login successfullu as \(authResult?.user.displayName!)")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "HomeTabBar")
                
//                self.dismiss(animated: true, completion: nil)
//                self.present(vc, animated: true)
            }
        }
        
    }
    
}
