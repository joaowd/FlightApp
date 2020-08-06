//
//  Utils.swift
//  FlightApp
//
//  Created by João Palma on 31/07/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//

import UIKit
import ImageLoader
import Foundation

typealias EventHandler = (Any) -> (Any)

infix operator ??=
func ??= <T>(left: inout T?, right: T) {
    left = left ?? right
}

public struct Utils {
    //public let keyWindow: UIWindow = UIApplication.shared.windows.first {$0.isKeyWindow}!
    
    public static func serializeJson<T : Codable>(object: T) -> NSDictionary {
        let jsonData = try? JSONEncoder().encode(object)
        let jsonResult = try? JSONSerialization.jsonObject(with: jsonData!) as? NSDictionary
        return jsonResult ?? ["" : ""]
    }
    
    
    public static func splitHoursString(_ hour : String) -> [String] {
        if(hour.isEmpty) {
            return ["", ""]
        }
        
        let split = hour.split(separator: ":")
        return [String(split[0]), String(split[1])]
    }
}
    
//    public static func getDateFromIso(_ isoDate : String) -> Date {
//        if(isoDate.isEmpty) {
//            return Date()
//        }
//
////        let dateFormatter = DateFormatter()
////        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
////        dateFormatter.locale = enUSPosixLocale
////        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
////        dateFormatter.calendar = Calendar(identifier: .gregorian)
//
//        //let iso8601String = dateFormatter.string(from: Date())
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//        //let date = dateFormatter.date(from: isoDate)!
//
//        //let date = dateFormatter.date(from: isoDate)
//
//        return dateFormatter.date(fromISO8601String: isoDate)
//    }
//}


extension DateFormatter {
    static let iso8601DateFormatter: DateFormatter = {
        let enUSPOSIXLocale = Locale(identifier: "en_US_POSIX")
        let iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.locale = enUSPOSIXLocale
        iso8601DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        iso8601DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return iso8601DateFormatter
    }()

    static let iso8601WithoutMillisecondsDateFormatter: DateFormatter = {
        let enUSPOSIXLocale = Locale(identifier: "en_US_POSIX")
        let iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.locale = enUSPOSIXLocale
        iso8601DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        iso8601DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return iso8601DateFormatter
    }()

    static func date(fromISO8601String string: String) -> Date? {
        if let dateWithMilliseconds = iso8601DateFormatter.date(from: string) {
            return dateWithMilliseconds
        }

        if let dateWithoutMilliseconds = iso8601WithoutMillisecondsDateFormatter.date(from: string) {
            return dateWithoutMilliseconds
        }

        return nil
    }
}
