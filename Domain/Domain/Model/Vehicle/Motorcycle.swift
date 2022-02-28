//
//  Motorcycle.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class Motorcycle: Vehicle {
    private var cylinderCapacity: Int
    
    public init(plate: String, cylinderCapacity: Int) throws {
        self.cylinderCapacity = cylinderCapacity
        try super.init(plate: plate)
        if !isTheCylinderCapacityValid(cylinderCapacity) {
            throw DomainErrors.InvalidCylinderCapacity()
        }
    }
    
    public func getCylinderCapacity() -> Int{
        return self.cylinderCapacity
    }
    
    private func isTheCylinderCapacityValid(_ cylinderCapacity: Int) -> Bool {
        let minimumPossibleCylinderCapacityOnAMotorcycle = 50
        return cylinderCapacity >= minimumPossibleCylinderCapacityOnAMotorcycle
    }
}
