//
//  ChatMessagesPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/12/22.
//

import Foundation
import Firebase

//MARK:- the Protocol
protocol ChatMessagesView {
    func messageSuccess()
    func messageError()
}
//MARK:- Presenter
class ChatMessagesPresenter {
    
    //MARK:- Properties
    var view: ChatMessagesView?
    
    //MARK:- Init
    init(view: ChatMessagesView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    func loadMessages() {
        // Read Messages By listener
        // empty the object everytime it gets an updates and append with new
    }
    
}
