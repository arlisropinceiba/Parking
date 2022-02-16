//
//  MotorcycleParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class MotorcycleParkingShift: ParkingShift{
    
    public init(admissionDate: Date, departureDate: Date?, motorcycle: Motorcycle) throws {
        try super.init(admissionDate: admissionDate, departureDate: departureDate, vehicle: motorcycle)
    }
    
    convenience public init(admissionDate: Date, motorcycle: Motorcycle) throws {
        try self.init(admissionDate: admissionDate, departureDate: nil, motorcycle: motorcycle)
    }
    
    public func getMotorcycle() -> Motorcycle? {
        return getVehicle() as? Motorcycle
    }
}
