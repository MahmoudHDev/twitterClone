//
//  ViewPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 7/1/22.
//

import Foundation

protocol ViewPresenterProtocol {
    func updateUI()
}
//MARK:- Presenter

class ViewPresenter {
    //MARK:- Properties

    var view: ViewPresenterProtocol?
    
    //MARK:- Init
    init(view: ViewPresenterProtocol) {
        self.view = view
    }
    
    //MARK:- Methods
    
}
