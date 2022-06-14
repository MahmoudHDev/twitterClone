//
//  ChatPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import Foundation
import Firebase

protocol ChatView {
    func messageLoaded()
    
}

class ChatPresenter {
    //MARK:- Properties
    var view: ChatView?
    
    //MARK:- Init
    init(view: ChatView) {
        self.view = view
    }
    

}
