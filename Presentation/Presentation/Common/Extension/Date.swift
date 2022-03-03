//
//  Date.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Foundation

extension Date {

    func inHourDateFormat() -> String {
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "hh:mm:ss a"
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE, d"
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MMMM"
        let hour = dateFormatterHour.string(from: self)
        let day = dateFormatterDay.string(from: self)
        let month = dateFormatterMonth.string(from: self)
        return "\(hour)\n\(day.capitalized) de \(month)"
    }

    func inDateHourFormat() -> String {
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "hh:mm:ss a"
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE, d"
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MMMM"
        let hour = dateFormatterHour.string(from: self)
        let day = dateFormatterDay.string(from: self)
        let month = dateFormatterMonth.string(from: self)
        return "\(day.capitalized) de \(month) a las \(hour)"
    }
}
