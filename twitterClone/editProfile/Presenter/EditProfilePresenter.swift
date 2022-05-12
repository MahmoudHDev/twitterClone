//
//  EditProfilePresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import Foundation
import Firebase

//MARK:- The Protocol
protocol EditProfileView {
    func dataDidChange()
    func dataDidNotChange()
}

//MARK:- The Presenter
class EditProfilePresenter {
    
    //MARK:- Properties
    var view: EditProfileView?
    
    //MARK:- Init
    init(view: EditProfileView) {
        self.view = view
    }
    
    //MARK:- Methods
    

}

