//
//  SignUpPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/6/22.
//

import Foundation
import Firebase

protocol SignUpPresenterView: class {
    
    func signUpSuccess(username: String, email: String)
    func signUpError(error: String)
    
}

class SignUpPresenter {
    
    //MARK:- Properties
    private weak var view: SignUpPresenterView?
    private let databaseRef = Database.database().reference()
    
    //MARK:- Init
    init(view: SignUpPresenterView) {
        self.view = view
    }
    
    //MARK:- Methods
    func registerUser(name: String, email: String, password: String) {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let er = error as NSError? {
                    switch AuthErrorCode(rawValue: er.code) {
                    case .weakPassword:
                        print("Weak Password!")
                        self.view?.signUpError(error: "Weak Password!")
                    case .userDisabled:
                        print("the user account has been disabled")
                        self.view?.signUpError(error: "the user account has been disabled")
                    case .wrongPassword:
                        print("The passwrod is invalid")
                        self.view?.signUpError(error: "The passwrod is invalid")
                    case .invalidEmail:
                        print("the email is malformed")
                        self.view?.signUpError(error: "the email is malformed")
                    case .emailAlreadyInUse:
                    print("Email Is Already in use")
                        self.view?.signUpError(error: "Email Is Already in use")
                    default:
                        print(" the localized Error --> \(er.localizedDescription)")
                        self.view?.signUpError(error: "Error! \(er.localizedDescription)")

                    }
                }else{
                    // Array that contains the user
                    guard let userInformation = authResult else { return }
                    self.view?.signUpSuccess(username: "\(userInformation.user.providerID)", email: "\(userInformation.user.email!)")
                    print("Login successfullu as \(userInformation.user.email!)")
                }
            }
        }
        
}
