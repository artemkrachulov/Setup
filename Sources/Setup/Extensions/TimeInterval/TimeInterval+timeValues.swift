//
//  TimeInterval+timeValues.swift
//  
//
//  Created by Artem on 26.05.2020.
//

import Foundation

extension TimeInterval {
    
    public static let millisecond = 0.001
    public static let second = TimeInterval.millisecond * 1000
    public static let minute = TimeInterval.second * 60
    public static let hour = TimeInterval.minute * 60
    public static let day = TimeInterval.hour * 24

    /// Converts seconds to milliseconds
    public func toMilliseconds() -> Double {
        return self / TimeInterval.millisecond
    }

    /// Converts seconds from milliseconds
    public func toSeconds() -> Double {
        return self * TimeInterval.millisecond
    }
    
    /// Converts seconds to milliseconds
    public mutating func ms() {
        self = self / TimeInterval.millisecond
    }
    
    /// Converts seconds from milliseconds
    public mutating func sec() {
        self = self * TimeInterval.millisecond
    }
}
