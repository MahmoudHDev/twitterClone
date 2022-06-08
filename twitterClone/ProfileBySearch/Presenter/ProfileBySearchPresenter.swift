//
//  ProfileBySearchPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/8/22.
//

import Foundation

//MARK:- view
protocol ProfileFromSearchView {
    func loadInfo()
}

//MARK:- Presenter

class ProfileBySearchPresenter {
    //MARK:- Properties

    var view: ProfileFromSearchView?
    
    //MARK:- Init
    init(view: ProfileFromSearchView) {
        self.view = view
    }
    //MARK:- Methods

    
    
}
