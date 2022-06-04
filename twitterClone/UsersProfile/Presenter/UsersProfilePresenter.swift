//
//  UsersProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/4/22.
//

import Foundation
import Firebase

//MARK:- Protocol

protocol UsersProfileView {
    func dataDidLoad()
}

//MARK:- Presenter

class UsersProfilePresenter {
    //MARK:- Properties

    let view: UsersProfileView?
    
    //MARK:- initializer

    init(view: UsersProfileView) {
        self.view = view
    }
    
    //MARK:- Methods

    
    func loadUserData() {
        // get Data From FireBase
    }
    
}
