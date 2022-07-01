//
//  LoginViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:- Properties
    @IBOutlet weak var signIn           : UIButton!
    @IBOutlet weak var passwordTxtField : UITextField!
    @IBOutlet weak var emailTxtField    : UITextField!
    @IBOutlet weak var errorLbl         : UILabel!
    lazy var presenter = LoginPresenter(view: self)

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        signIn.layer.cornerRadius = 5
    }
    
    //MARK:- Functions
    

    
    //MARK:- Actions

    @IBAction func loginBtn(_ sender: UIButton) {

        presenter.login(email: emailTxtField.text!, password: passwordTxtField.text!)
        
    }
    
}

//MARK:- Login Presenter Protocol
extension LoginViewController: LoginPresenterProtocol {
    func showError(error: String) {
        // Show The Error
        errorLbl.isHidden = false
        errorLbl.text = error
        print(error)
        
    }
    
    func login(email: String) {
        // update the UI
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeTabBar")
        self.dismiss(animated: true, completion: nil)
        self.present(vc, animated: true)
    }
    
}

