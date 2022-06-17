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
    
    let db = Firestore.firestore()
    //MARK:- Init
    
    init(view: ChatView) {
        self.view = view
    }
 
    func loadMessages() {
        let tweetRef = db.collection(K.FStore.collectionMsgName).addSnapshotListener { (querySnapshot, err) in
            if let error = err {
                print(error)
            }else{
                if let docs = querySnapshot?.documents {
                    for doc in docs {
                        let data = doc.data()
                        print(data[K.FStore.messageContent] as? String)
                        self.view?.messageLoaded()
                    }
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
