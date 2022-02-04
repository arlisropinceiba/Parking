//
//  Date.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

extension Date {
    func advanceDate(thisHours hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? Date()
    }
    
    func lateDate(thisHours hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: -hours, to: self) ?? Date()
    }
}
