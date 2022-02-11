//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class CarParkingShift: ParkingShift {
    
    public init(admissionDate: Date, car: Car) throws {
        try super.init(admissionDate: admissionDate, vehicle: car)
    }
    
    public init(admissionDate: Date, departureDate: Date?, car: Car) throws {
        try super.init(admissionDate: admissionDate, departureDate: departureDate, vehicle: car)
    }
    
    public func getCar() -> Car? {
        return getVehicle() as? Car
    }
}
