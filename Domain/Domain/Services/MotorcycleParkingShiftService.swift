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
    
    public override func saveThis(shift: ParkingShift) async throws {
        try areThereParkingSpaces()
        try await super.saveThis(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfMotorcyclesAllowed = 10
        let motorcyclesCount  = try (parkingShitRepository as? MotorcycleParkingShiftRepository)?.getCountOfMotorcycles() ?? minimumNumberOfMotorcyclesAllowed
        guard motorcyclesCount < minimumNumberOfMotorcyclesAllowed else {
            throw DomainErrors.MotorcycleLimitReached()
        }
    }
}
