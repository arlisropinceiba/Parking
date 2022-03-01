//
//  Date.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Foundation

class DateFormat {
    
    class func inHourDateFormat(_ date: Date) -> String {
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "hh:mm:ss a"
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE, d"
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MMMM"
        let hour = dateFormatterHour.string(from: date)
        let day = dateFormatterDay.string(from: date)
        let month = dateFormatterMonth.string(from: date)
        return "\(hour)\n\(day.capitalized) de \(month)"
    }
    
    class func inDateHourFormat(_ date: Date) -> String {
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "hh:mm:ss a"
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE, d"
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MMMM"
        let hour = dateFormatterHour.string(from: date)
        let day = dateFormatterDay.string(from: date)
        let month = dateFormatterMonth.string(from: date)
        return "\(day.capitalized) de \(month) a las \(hour)"
    }
    
}
