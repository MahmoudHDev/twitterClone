//
//  ChatPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import Foundation
import Firebase

protocol ChatView {
    func emptyArray()
    func messageLoaded(messages: MessagesInfo)
    func messageSent()
    func errorWhileLoading(error: String)
}

class ChatPresenter {
    //MARK:- Properties
    var view: ChatView?
    let db = Database.database().reference()
    let ref = Firestore.firestore()
    
    //MARK:- Init
    
    init(view: ChatView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    func loadMessages(id: String) {
        
    }
    
    // send a message
    func sendMessage(txt: String, toID: String, toName: String) {
        guard let userID = Auth.auth().currentUser else {return}
        // Sender Side
        let time = Timestamp()
        let data    : [String : Any] = [
            K.FStore.fromId: userID.uid,
            K.FStore.toId: toID,
            K.FStore.mssg: txt,
            K.FStore.time: time
        ]
        let document = ref.collection(K.FStore.mssgCollection)
            .document(userID.uid)
            .collection(toID)
            .document()
        document.setData(data) { error in
            if let err = error {
                print("error has been occured \(err.localizedDescription)")
            }else {
                // Persist the data to show it in the second half
                
                self.view?.messageSent()
            }
        }
        
        // Receiver Side
        let recepientMessageDocument = ref.collection(K.FStore.mssgCollection)
            .document(toID)
            .collection(userID.uid)
            .document()
        recepientMessageDocument.setData(data) { error in
            if let err = error {
                print("Error has been occured \(err.localizedDescription)")
            }else {
                
                // Persist the data to the second side

                self.view?.messageSent()
            }
            
        }
    }
    
    
}
