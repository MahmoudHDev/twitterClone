//
//  LoginPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/5/22.
//

import Foundation
import Firebase

//MARK:- Presenter Protocol

protocol LoginPresenterProtocol: NSObjectProtocol {
    
    func login(email: String)
    func showError(error: String)
}

//MARK:- LoginPresenter

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
                    self.view?.showError(error: "Emails and accounts are not enabled")
                    print("Emails and accounts are not enabled")
                case .userDisabled:
                    self.view?.showError(error: "the user account has been disabled")
                    print("the user account has been disabled")
                case .wrongPassword:
                    self.view?.showError(error: "The passwrod is invalid")
                    print("The passwrod is invalid")
                case .invalidEmail:
                    self.view?.showError(error: "the email is malformed")
                    print("the email is malformed")
                default:
                    print(" the localized Error --> \(er.localizedDescription)")
                    self.view?.showError(error: er.localizedDescription)
                }
            }else{
                // Array that contains the user
                guard let userInformation = authResult else { return }
                print("Login successfullu as \(userInformation.user.email!)")
                self.view?.login(email: userInformation.user.email!)
            }
        }
    }
    
}
