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
    var db      = Firestore.firestore()      // DBRealTime, Firestore
    let ref     =  Database.database().reference()
    var arrID   = [String]()

    //MARK:- Init
    init(view: MessagesView) {
        self.view = view
    }
    
    //MARK:- Methods
    
    func loadMessages() {
        print("Load Messages...")
        guard let userID = Auth.auth().currentUser?.uid else {return}
        self.view?.emptyArrays()
        print("Empty the array")
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
                    print("sender: \(sender), Rec: \(receiver)")
                    self.appendData(id: receiver!)
                    self.view?.messagesLoaded(messages: mssg)
                    print("View. MEssages Laoded")
                }
            }
            self.usersData()
        }
        
    }
    
    func appendData(id: String) {
        arrID.append(id)
        
    }
    
    func usersData() {
        let removeDuplicated = arrID.unique()
        print("array \(removeDuplicated)")
        self.view?.emptyArrays()
        print("Empty The Array Users")
        for id in removeDuplicated {
            ref.child(K.collections.users).child(id).observe(.value) { (dataSnapshot) in                guard let safeData    = dataSnapshot.value as? NSDictionary else {return}
                
                let userId      = safeData[K.user.userID] as? String,
                    userPhoto   = safeData[K.user.profilePhoto] as? String,
                    username    = safeData[K.user.username] as? String
                
                var users           = TweeterUsers()
                users.profilePhoto  = userPhoto
                users.userID        = userId
                users.username      = username
                
                self.view?.loadUsers(users: users)
                print("View.Load Users")
            }
        }

        
    }
    
    
}


//MARK:- Extensions

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
