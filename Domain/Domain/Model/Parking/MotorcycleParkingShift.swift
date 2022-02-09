//
//  MotorcycleParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class MotorcycleParkingShift: ParkingShift{
    
    public init(admissionDate: Date, motorcycle: Motorcycle) throws {
        super.init(admissionDate: admissionDate, vehicle: motorcycle)
    }
    
    public init(admissionDate: Date, departureDate: Date, motorcycle: Motorcycle) throws {
        super.init(admissionDate: admissionDate, departureDate: departureDate, vehicle: motorcycle)
    }
    
    public func getMotorcycle() -> Motorcycle? {
        return getVehicle() as? Motorcycle
    }
}
