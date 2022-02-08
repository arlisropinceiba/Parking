//
//  Motorcycle.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class MotorcycleParkingShiftService: ParkingShiftService {
    
    public func saveThis(shift: ParkingShift) throws {
        try areThereParkingSpaces()
        try saveParkingShift(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfMotorcyclesAllowed = 10
        guard parkingShitRepository.getCountOfVehicles() < minimumNumberOfMotorcyclesAllowed else {
            throw DomainErrors.motorcycleLimitReached()
        }
    }
}
