//
//  MessagesPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/17/22.
//

import Foundation
import Firebase

//MARK:- Protocol

protocol MessagesView {
    func emptyArrays()
    func emptyUsers()
    func messagesLoaded(messages: MessagesInfo)
    func loadUsers(users: TweeterUsers)
}

//MARK:- Presenter

class MessagesPresenter {
    
    //MARK:- Properties
    var view    : MessagesView?
    var db      = Firestore.firestore()      // Firestore
    let ref     = Database.database().reference()  // DBRealTime
    var arrID   = [String]()
    
    //MARK:- Init
    init(view: MessagesView) {
        self.view = view
    }
    
    //MARK:- Methods
    func loadMessages() {
        self.view?.emptyArrays()
        
    }
}

//MARK:- Extensions
// use this extension when you want to remove the duplicates
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
