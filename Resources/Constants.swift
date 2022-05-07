//
//  Constants.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import Foundation
struct K {
    static let cellIdentifier = "cell"
    
    // to validate with true and false use:
    /*
    // for one digit and one charachter
     
     print(K.passOneDigAndChar.evaluate(with: "pas$word"))
     print(K.passOneDigAndChar.evaluate(with: "password"))
     */
    static let passOneDigAndChar = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
    
    // Fill it with constants so u can the strings later inside the project
}
