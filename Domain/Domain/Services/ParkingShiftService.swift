//
//  ParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class ParkingShiftService {
    
    public let parkingShitRepository: ParkingShiftRepository
    
    public init(parkingShitRepository: ParkingShiftRepository) {
        self.parkingShitRepository = parkingShitRepository
    }
    
    public func saveThis(shift: ParkingShift) async throws {
        if try parkingShitRepository.isThereAVehicleWithActiveParkingShift(plate: shift.getVehicle().getPlate()) {
            try await parkingShitRepository.saveParkingShift(shift: shift)
        } else {
            throw DomainErrors.ExistingPlate()
        }
    }
    
    public func getParkingShift() throws -> [ParkingShift] {
        return try parkingShitRepository.getParkingShift()
    }
    
    public func finishParkingShift(shift: ParkingShift) throws {
        try parkingShitRepository.finishParkingShift(shift: shift)
    }
    
    public func searchVehicle(withPlate plate: String) throws -> [ParkingShift] {
        try parkingShitRepository.searchVehicle(withPlate: plate)
    }
}
