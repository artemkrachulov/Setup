//
//  Date+string.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation

extension Const {
    
    public enum DatabaseDate {
        
        public enum MySQL {
            public static let date = "yyyy-MM-dd"
            public static let dateTime = "yyyy-MM-dd HH:mm:ss"
        }
    }
}


extension Date {
    
    init?(string: String, dateFormat: String = Const.DatabaseDate.MySQL.dateTime, calendar: Calendar = Calendar.current, locale: Locale = Locale.current) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.calendar = calendar
        formatter.locale = locale
        
        guard let date = formatter.date(from: string)
            else { return nil }
        
        self = date
    }
    
    /**
     Returns the string representation of this date in a custom format.

     - parameter dateFormat: The format in which to print the date, e.g. "yyyy/MM/dd".
     - parameter calendar: The calendar to use.
     - returns: The string representation.
     */
    public func string(withFormat dateFormat: String, calendar: Calendar = Calendar.current) -> String {
        let formatter = DateFormatter()
        formatter.calendar = calendar
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
}
