//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class CarParkingShift: ParkingShift {
    
    public init(id: UUID, admissionDate: Date, departureDate: Date?, car: Car) throws {
        try super.init(id: id, admissionDate: admissionDate, departureDate: departureDate, vehicle: car)
    }
    
    convenience public init(id: UUID, admissionDate: Date, car: Car) throws {
        try self.init(id: id, admissionDate: admissionDate, departureDate: nil, car: car)
    }
    
    public func getCar() -> Car? {
        return getVehicle() as? Car
    }
}
