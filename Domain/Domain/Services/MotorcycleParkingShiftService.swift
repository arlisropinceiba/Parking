//
//  Motorcycle.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class MotorcycleParkingShiftService: ParkingShiftService {
    
    public init(motorcycleParkingShiftRepository: MotorcycleParkingShiftRepository) {
        super.init(parkingShitRepository: motorcycleParkingShiftRepository)
    }
    
    public func saveThis(shift: ParkingShift) throws {
        try areThereParkingSpaces()
        try saveParkingShift(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfMotorcyclesAllowed = 20
        let motorcyclesCount  = try (parkingShitRepository as? MotorcycleParkingShiftRepository)?.getCountOfMotorcycles() ?? minimumNumberOfMotorcyclesAllowed
        guard motorcyclesCount < minimumNumberOfMotorcyclesAllowed else {
            throw DomainErrors.motorcycleLimitReached()
        }
    }
}
