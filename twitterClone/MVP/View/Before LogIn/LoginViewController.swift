//
//  LoginViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    //MARK:- Properties

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    //MARK:- Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        signIn.layer.cornerRadius = 5
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailTxtField.text, let password = passwordTxtField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard let result = authResult else {return}
            
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    print("Emails and accounts are not enabled")
                case .userDisabled:
                    print("the user account has been disabled")
                case .wrongPassword:
                    print("The passwrod is invalid")
                case .invalidEmail:
                    print("the email is malformed")
                default:
                    print(" the localized Error --> \(error.localizedDescription)")
                }
            }else{
                // Array that contains the user
                print("Login successfullu as \(result.user.email!)")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "HomeTabBar")
                self.dismiss(animated: true, completion: nil)
                self.present(vc, animated: true)
            }
        }
    }
    
}
