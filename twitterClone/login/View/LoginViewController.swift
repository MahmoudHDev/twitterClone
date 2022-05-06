//
//  LoginViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    //MARK:- Properties
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    lazy var presenter = LoginPresenter(view: self)

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        signIn.layer.cornerRadius = 5
    }
    
    //MARK:- Methods
    

    
    //MARK:- Actions

    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailTxtField.text, let password = passwordTxtField.text else {return}
        presenter.login(email: email, password: password)

        }
    }
    
//MARK:- Login Presenter Protocol

extension LoginViewController: LoginPresenterProtocol {
    func showError(error: String) {
        // Error
        print(error)
    }
    


    
    
    func login(email: String, password: String) {
        // Do something
    }
    
    
}

