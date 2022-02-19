//
//  MotorcycleParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class MotorcycleParkingShift: ParkingShift{
    
    public init(id: UUID, admissionDate: Date, departureDate: Date?, motorcycle: Motorcycle) throws {
        try super.init(id: id, admissionDate: admissionDate, departureDate: departureDate, vehicle: motorcycle)
    }
    
    convenience public init(id: UUID, admissionDate: Date, motorcycle: Motorcycle) throws {
        try self.init(id: id, admissionDate: admissionDate, departureDate: nil, motorcycle: motorcycle)
    }
    
    public func getMotorcycle() -> Motorcycle? {
        return getVehicle() as? Motorcycle
    }
}
