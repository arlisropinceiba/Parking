//
//  ParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public class ParkingShiftService {
    
    let parkingShitRepository: ParkingShiftRepository
    
    public init(parkingShitRepository: ParkingShiftRepository) {
        self.parkingShitRepository = parkingShitRepository
    }
    
    public func saveParkingShift(shift: ParkingShift) throws {
        if parkingShitRepository.isThereAVehicleWithActiveParkingShift() {
            parkingShitRepository.saveParkingShift(shift: shift)
        } else {
            throw DomainErrors.existingPlate()
        }
    }
    
    public func getParkingShift() -> [ParkingShift] {
        return parkingShitRepository.getParkingShift()
    }
    
    public func getCountOfVehicles () -> Int {
        return parkingShitRepository.getCountOfVehicles()
    }
    
    public func finishParkingShift(shift: ParkingShift){
        parkingShitRepository.finishParkingShift(shift: shift)
    }
    
    public func searchVehicle(withPlate plate: String) -> [ParkingShift] {
        parkingShitRepository.searchVehicle(withPlate: plate)
    }
}
