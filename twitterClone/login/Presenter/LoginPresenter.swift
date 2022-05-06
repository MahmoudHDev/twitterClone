//
//  LoginPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/5/22.
//

import Foundation
protocol LoginPresenterProtocol {
    
    func login(email: String, password: String)
    func showError(error: Error)
    
}

class LoginPresenter {
    //MARK:- Properties
    private var view: LoginPresenterProtocol?
    
    //MARK:- Init
    init(view: LoginPresenterProtocol) {
        self.view = view
    }

    //MARK:- Methods
    
    func login(email: String, password: String) {
        print("Please enter the username and the password")
    }
    
}
