//
//  ProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import Foundation

//MARK:- The Protocol

protocol ProfilePresenterView {
    
}
//MARK:- The Presenter

class ProfilePresenter {
    
    //MARK:- Properties
    var view: ProfilePresenterView?
    
    //MARK:- Init

    init(view: ProfilePresenterView) {
        self.view = view
    }
    
    //MARK:- Methods

    
    
}
