//
//  ParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public class ParkingShift {
   
    private var id: UUID = UUID()
    private var admissionDate: Date
    private var departureDate: Date?
    private var vehicle: Vehicle
    
    public init(
        admissionDate: Date,
        vehicle: Vehicle
    ){
        self.admissionDate = admissionDate
        self.vehicle = vehicle
    }
    
    public init(
        admissionDate: Date,
        departureDate: Date,
        vehicle: Vehicle
    ){
        self.admissionDate = admissionDate
        self.departureDate = departureDate
        self.vehicle = vehicle
    }
    
    public func getId() -> UUID {
        return id
    }
    
    public func getAdmissionDate() -> Date {
        return admissionDate
    }
    
    public func setDepartureDate(_ date: Date) throws {
        if date >= admissionDate {
            departureDate = date
        } else {
            throw DomainErrors.invalidDate()
        }
    }
    
    public func getDepartureDate() throws -> Date {
        guard let date = departureDate else {
            throw DomainErrors.noExistDepartureDate()
        }
        return date
    }
    
    public func getVehicle() -> Vehicle {
        return vehicle
    }
    
    public func getLenghtOfStay(fromAdmissionDateTo endDate: Date) -> String {
        let diffComponents = Calendar.current.dateComponents([.hour], from: admissionDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        var daysInt = 0
        var restHours = 0
        if hours > 0 {
            (daysInt, restHours) = getTheDaysAndHours(between: admissionDate, and: endDate)
        }
        if daysInt == 0 {
            return "\(hours)H"
        } else {
            return "\(daysInt)D \(restHours)H"
        }
    }
    
    private func getTheDaysAndHours(between beginDate: Date, and endDate: Date) -> (days: Int, hours: Int){
        let diffComponents = Calendar.current.dateComponents([.hour], from: beginDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        let daysInt = Int(hours / 24)
        let restHours = Int(round((Double(hours) / 24 - Double(daysInt)) * 24.0))
        return (daysInt, restHours)
    }
}
