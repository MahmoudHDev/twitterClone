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
    func messagesLoaded(messages: MessagesInfo)
}

//MARK:- Presenter

class MessagesPresenter {

    //MARK:- Properties
    var view: MessagesView?
    var db = Firestore.firestore()      // DBRealTime, Firestore
    let ref     =  Database.database().reference()
    var arrID = [String]()

    //MARK:- Init
    init(view: MessagesView) {
        self.view = view
    }
    
    //MARK:- Methods

    // load Messages that belongs to me
    
    func loadMessages() {
        print("Load Messages...")
        guard let userID = Auth.auth().currentUser?.uid else {return}
        db.collection(K.FStore.collectionMsgName).whereField(K.FStore.senderID, isEqualTo: userID).addSnapshotListener { (querySnapShot, error) in
            if let error = error {
                print("There's no messages \(error)")
            }else {
                guard let docs = querySnapShot?.documents else{ return }
                for doc in docs {
                    let data = doc.data()
                    let sender   = data[K.FStore.senderID] as? String,
                        msg      = data[K.FStore.messageContent] as? String,
                        receiver = data[K.FStore.receiverID] as? String
                    let mssg = MessagesInfo(senderID: sender ?? "" , messageContent: msg ?? "", receiverID: receiver ?? "")
                    
                    self.usersData(id: receiver ?? "")
                    self.view?.messagesLoaded(messages: mssg)
                    
//                    show the last message in tableView and the name
                }
            }
        }
        
    }
    
    func usersData(id: String) {
        arrID.append(id)
        for ids in arrID {
            ref.child(K.collections.users)
                .child(ids).observe(.value) { (dataSnapshot) in
                    guard let safeData = dataSnapshot.value as? NSDictionary else {return}
                    let username = safeData[K.user.username] as? String
                    print(username)
                }
        }
        
        print("Fetch user Info")
        print(arrID)
        // user photo
    }
    
    
    
}
