//
//  Payment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

class ParkingShiftPayment {
    
    var id: UUID = UUID()
    var parkingShift: ParkingShift
    var priceDay: Int
    var priceHour: Int
    var value: Int = 0
    
    init(
        parkingShift: ParkingShift,
        priceDay: Int,
        priceHour: Int
    ) {
        self.parkingShift = parkingShift
        self.priceDay = priceDay
        self.priceHour = priceHour
    }
        
    public func calculateParkingShiftPrice() throws -> Int {
        var days: Int = 0
        var hours: Int = 0
        let endDate = try parkingShift.getDepartureDate()
        (days, hours) = getTheShiftDaysAndHours(between: parkingShift.getAdmissionDate(), and: endDate)
        var value = days * priceDay
        value += hours * priceHour
        return value
    }
    
    private func getTheShiftDaysAndHours(between beginDate: Date, and endDate: Date) -> (days: Int, hours: Int){
        let minimumHoursToChargeAsADay = 9
        let diffComponents = Calendar.current.dateComponents([.hour], from: beginDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        var daysInt = Int(hours / 24)
        var restHours = Int(round((Double(hours) / 24 - Double(daysInt)) * 24.0))
        if restHours >= minimumHoursToChargeAsADay {
            daysInt += 1
            restHours = 0
        }
        return (daysInt, restHours)
    }
    
}