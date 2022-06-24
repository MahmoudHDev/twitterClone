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
    func currentUser(user: TweeterUsers)
    func messageSent()
}

class ChatPresenter {
    //MARK:- Properties
    
    var view: ChatView?
    let db      = Database.database().reference()
    let ref     = Firestore.firestore()
    var myInfo  = TweeterUsers()
    //MARK:- Init
    
    init(view: ChatView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    func currentUserInfo() {
        print("Loading Users")
        guard let userID = Auth.auth().currentUser?.uid else {return}
        db.child(K.collections.users).child(userID)
            .observe(.value) { (dataSnapshot) in
                guard let value = dataSnapshot.value as? NSDictionary else {return}
                let theID = value["userID"] as? String
                let username = value["username"] as? String
                let email = value["email"] as? String
                let photo = value["profilePhoto"] as? String
                let userModel = TweeterUsers(userID: theID, username: username, email: email, profilePhoto: photo)
                self.view?.currentUser(user: userModel)
            }
    }
    
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
    
    //MARK:- Sending Message


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
                self.persistRecentMessagesSender(toId: toID, text: txt, recName: toName)
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
                self.persistRecentMessagesReceiver(toId: toID, text: txt, fromName: "current username")
                self.view?.messageSent()
            }
        }
    } // End of sending
    
    func persistRecentMessagesSender(toId: String, text: String, recName: String) {
        guard let userID = Auth.auth().currentUser else {return}
        let document = ref.collection("recent_Messages")
            .document(userID.uid)
            .collection("messages")
            .document(toId)
        
        let data :[String: Any] = [
            "timeStamp" : Timestamp(),
            "text"      : text,
            "fromId"    : userID.uid,
            "toId"      : toId,
            "name"    : recName
            // Email & profilePhoto
        ]
        document.setData(data) { (er) in
            if let err = er {
                print("Error RecentMessages \(err) ")
            }else {
                print("Sender: Successfully sent to Firestore")
            }
        }
        
        
    }
    
    func persistRecentMessagesReceiver(toId: String, text: String, fromName: String) {
        guard let userID = Auth.auth().currentUser else {return}
        let document = ref.collection("recent_Messages")
            .document(toId)
            .collection("messages")
            .document(userID.uid)
        
        let data :[String: Any] = [
            "timeStamp" : Timestamp(),
            "text"      : text,
            "fromId"    : toId,
            "toId"      : userID.uid,
            "name"      : fromName
            
        ]
        document.setData(data) { (er) in
            if let err = er {
                print("Error RecentMessages \(err) ")
            }else {
                print("Receiver Successfully sent to Firestore")
            }
        }
    }
    
}
