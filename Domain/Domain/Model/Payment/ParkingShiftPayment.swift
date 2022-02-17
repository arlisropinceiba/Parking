//
//  Payment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class ParkingShiftPayment {
    
    private var id: UUID = UUID()
    private var parkingShift: ParkingShift
    private var priceDay: Int
    private var priceHour: Int
    private var value: Int = 0
    
    public init(
        parkingShift: ParkingShift,
        priceDay: Int,
        priceHour: Int
    ) {
        self.parkingShift = parkingShift
        self.priceDay = priceDay
        self.priceHour = priceHour
    }
    
    public func getParkingShift() -> ParkingShift {
        return parkingShift
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
        let dayHours = 24
        let diffComponents = Calendar.current.dateComponents([.hour], from: beginDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        var daysInt = Int(hours / dayHours)
        var restHours = Int(round((Double(hours) / Double(dayHours) - Double(daysInt)) * Double(dayHours)))
        if restHours >= minimumHoursToChargeAsADay {
            daysInt += 1
            restHours = 0
        }
        return (daysInt, restHours)
    }
    
}
