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
    func messageLoaded(messages: Message)
    func messageSent()
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
        guard let userID = Auth.auth().currentUser?.uid else {return}
        ref.collection("messages")
            .document(userID)
            .collection(id)
            .order(by:K.FStore.time)
            .addSnapshotListener { (querySnapshot, err) in
                if let er = err {
                    print("Error while loading the messages \(er.localizedDescription)")
                }else {
                    self.view?.emptyArray()
                    querySnapshot?.documents.forEach({ (queryDocumentSnapshot) in
                        let data    = queryDocumentSnapshot.data()
                        let mssg    = data[K.FStore.mssg] as? String ?? ""
                        let toID    = data[K.FStore.toId] as? String ?? ""
                        let fromID  = data[K.FStore.fromId] as? String ?? ""
                        let messages = Message(toId: toID, fromId: fromID, mssg: mssg)
                        self.view?.messageLoaded(messages: messages)
                    })
                }
            }
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
            }else{
                // Persist the data to the second side
                
                self.view?.messageSent()
            }
        }
    }
    
}
