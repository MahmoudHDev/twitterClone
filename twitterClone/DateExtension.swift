//
//  DateExtension.swift
//  twitterClone
//
//  Created by Mahmoud on 5/11/22.
//

import Foundation

extension Date {
    init(_ dateString: String) {
        let dateStrningFormatter = DateFormatter()
        dateStrningFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        dateStrningFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStrningFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}
