//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class CarParkingShiftService: ParkingShiftService {
    
    public func saveThis(shift: ParkingShift) throws {
        try areThereParkingSpaces()
        try saveParkingShift(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfCarsAllowed = 20
        guard parkingShitRepository.getCountOfVehicles() < minimumNumberOfCarsAllowed else {
            throw DomainErrors.carLimitReached()
        }
    }
}
