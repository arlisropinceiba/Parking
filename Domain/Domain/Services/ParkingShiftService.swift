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
            throw DomainErrors.ExistingPlate()
        } else {
            try await parkingShitRepository.saveParkingShift(shift: shift)
        }
    }
    
    public func getParkingShift() throws -> [ParkingShift] {
        let shifts = try parkingShitRepository.getParkingShift()
        return shifts
    }
    
    public func getFinalizedParkingShifts() throws -> [ParkingShiftPayment]{
        return try parkingShitRepository.getFinalizedParkingShifts()
    }
    
    public func finishParkingShift(shift: ParkingShiftPayment) async throws {
        try await parkingShitRepository.finishParkingShift(shift: shift)
    }
    
    public func searchParkingShift(withPlate plate: String) throws -> [ParkingShift] {
        try parkingShitRepository.searchParkingShift(withPlate: plate)
    }
    
    public func searchFinalizedParkingShift(withPlate plate: String) throws -> [ParkingShiftPayment] {
        try parkingShitRepository.searchFinalizedParkingShift(withPlate: plate)
    }
}
