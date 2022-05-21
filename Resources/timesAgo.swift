//
//  timesAgo.swift
//  twitterClone
//
//  Created by Mahmoud on 5/21/22.
//

import Foundation
extension Date{
    
    func timesAgoDisplay() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minutes =  60
        let hours = 60 * minutes
        let day = 24 * hours
        let week = 7 * day
        
        if secondsAgo < minutes {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hours {
            return "\(secondsAgo / minutes) mins"
        }else if secondsAgo < day {
            return "\(secondsAgo / hours) mins ago"
        }else if secondsAgo < week {
            return "\(secondsAgo / day) mins ago"
        }
        
        return "\(secondsAgo / week) weeks"
    }
    
}
