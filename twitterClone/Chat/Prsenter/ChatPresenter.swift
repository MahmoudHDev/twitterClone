//
//  ChatPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/13/22.
//

import Foundation
import Firebase

protocol ChatView {

    func messageLoaded(messages: MessagesInfo)
    func errorWhileLoading(error: String)
}

class ChatPresenter {
    //MARK:- Properties
    var view: ChatView?
    
    let db = Firestore.firestore()
    //MARK:- Init
    
    init(view: ChatView) {
        self.view = view
    }
 
    func loadMessages(id: String) {
//        guard let userID = Auth.auth().currentUser?.uid else {return}
        // Empty the array to avoid appending the messages over and over
        // ID is the receiver ID
        
        db.collection(K.FStore.collectionMsgName).whereField(K.FStore.receiverID, isEqualTo: id).addSnapshotListener { (querySnapshot, er) in
            if let err = er {
                print("Error While Loading the Messages \(err)")
                self.view?.errorWhileLoading(error: "\(err.localizedDescription)")
            }else{
                guard let docs = querySnapshot?.documents else {return}
                for doc in docs {
                    let data        = doc.data()
                    let message     = data[K.FStore.messageContent] as? String  ?? ""   // for message
                    let receiverID  = data[K.FStore.receiverID] as? String      ?? ""   // for img
                    let senderID    = data[K.FStore.senderID] as? String        ?? ""   // for sender
//                    let time       = data[K.FStore.date] as? String ?? ""
                    
                    var messageInfo = MessagesInfo()
                    
                    messageInfo.receiverID      = receiverID
                    messageInfo.senderID        = senderID
                    messageInfo.messageContent  = message
//                    messageInfo.time = time       // Date
                    self.view?.messageLoaded(messages: messageInfo)
                }
            }
        }
    }
    
    // send a message
    func sendMessage(messageContent: String, msgReciever: String, date: Date) {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let values: [String : Any] = [
            K.FStore.messageContent : messageContent,
            K.FStore.date: date,
            K.FStore.senderID: userID,
            K.FStore.receiverID: msgReciever
        ]
        db.collection(K.FStore.collectionMsgName).addDocument(data: values) { (error) in
            if let error = error {
                print("Error While sending to the db \(error)")
            }else {
                print("Saved Successfully")
            }
        }
        // send the message to the database
    }

}
