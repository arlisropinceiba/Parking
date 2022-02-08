//
//  Date.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation
@testable import Domain

extension Date {

    func advanceDate(thisHours hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? Date()
    }
    
    func lateDate(thisHours hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: -hours, to: self) ?? Date()
    }
    
    func advanceDate(toThisDay day: DayOfWeek) -> Date {
        let date = Calendar.current.dateComponents([.weekday], from: self).weekday ?? 0
        return Calendar.current.date(byAdding: .day, value: (7 - date) + day.rawValue, to: self) ?? Date()
    }

    var localDate: Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}
