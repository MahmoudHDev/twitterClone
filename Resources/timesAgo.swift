//
//  timesAgo.swift
//  twitterClone
//
//  Created by Mahmoud on 5/21/22.
//

import Foundation
extension Date{
    // date format
    init(_ dateString: String) {
        let dateStrningFormatter = DateFormatter()
        dateStrningFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        dateStrningFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStrningFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
    
    // show sec, mins, days .. etc.
    
    func timesAgoDisplay() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minutes =  60
        let hours = 60 * minutes
        let day = 24 * hours
        let week = 7 * day
        
        if secondsAgo < minutes {
            return "\(secondsAgo)s"
        } else if secondsAgo < hours {
            return "\(secondsAgo / minutes)m"
        }else if secondsAgo < day {
            return "\(secondsAgo / hours)h"
        }else if secondsAgo < week {
            return "\(secondsAgo / day)d"
        }
        
        return "\(secondsAgo / week)w"
    }
    
    
    // another extensions
    
    func withAddedMinutes(mins: Double) -> Date {
        addingTimeInterval(mins * 60)
    }
    
    func withAddedHours(hours: Double) -> Date {
        withAddedMinutes(mins: hours * 60)
    }
    
}
