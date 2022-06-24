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
    var ref     = Firestore.firestore()      // Firestore
    let db      = Database.database().reference()  // DBRealTime
    var arrID   = [String]()
    
    //MARK:- Init
    init(view: MessagesView) {
        self.view = view
    }
    
    //MARK:- Methods
    func loadMessages() {
        guard let userID = Auth.auth().currentUser else {return}
        let document = ref.collection("recent_Messages")
            .document(userID.uid)
            .collection("messages")
            .order(by: "timeStamp")
        document.addSnapshotListener { (documentSnapshot, er) in
            if let err = er {
                print("error While loading the messages \(err.localizedDescription)")
            }else {
                self.view?.emptyArrays()
                documentSnapshot?.documents.forEach({ (queryDocumentSnapshot) in
                    let data = queryDocumentSnapshot.data()
                    
                    let text        = data["text"]      as? String
                    let to          = data["toId"]      as? String
                    let from        = data["fromId"]    as? String
                    let name        = data["name"]      as? String
                    
                    let RMessages   = MessagesInfo(mssg: text, toId: to, fromId: from, name: name)
                    
                    self.view?.messagesLoaded(messages: RMessages)
                    print(data)
                })
            }
        }
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

