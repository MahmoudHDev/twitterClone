//
//  SignUpViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    // Properties
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordSTxtField: UITextField!
    @IBOutlet weak var passwordFTxtField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpBtn.layer.cornerRadius = 5
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: emailTxtField.text!, password: passwordFTxtField.text!) { [weak self] (authResult, error) in
            guard let result = authResult?.additionalUserInfo, error == nil else {return}
            print(result)
        }

    }
    
}
