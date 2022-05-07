//
//  SignUpViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
   //MARK:- Properties
    lazy var presenter = SignUpPresenter(view: self)
    @IBOutlet weak var errorMessage     : UILabel!
    @IBOutlet weak var signUpBtn        : UIButton!
    @IBOutlet weak var emailTxtField    : UITextField!
    @IBOutlet weak var passwordSTxtField: UITextField!
    @IBOutlet weak var passwordFTxtField: UITextField!
    @IBOutlet weak var username         : UITextField!

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        signUpBtn.isEnabled = false
        signUpBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7323547006, blue: 0.947804749, alpha: 0.5)
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        signUpBtn.layer.cornerRadius = 5
    }
    //MARK:- Methods

    
    //MARK:- Actions
    @IBAction func signUpBtn(_ sender: UIButton) {
        // How to add name to the firebase cloud
        if passwordSTxtField.text != "" {
            presenter.registerUser(name: username.text!, email: emailTxtField.text!, password: passwordFTxtField.text!)
        }else{
            errorMessage.isHidden = false
            errorMessage.text = "Please fill your Data"
        }
    }
}

//MARK:- Presenter

extension SignUpViewController: SignUpPresenterView {

    func signUpSuccess(username: String, email: String) {
        self.dismiss(animated: true, completion: nil)
        present(HomeViewController(), animated: true)
        print("signed in as: \(username), \(email) ")
    }
    
    func signUpError(error: String) {
        errorMessage.isHidden = false
        errorMessage.text = error
    }
    
}
