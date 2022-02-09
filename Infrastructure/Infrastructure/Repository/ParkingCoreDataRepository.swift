//
//  ParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class ParkingCoreDataRepository: CoreDataManager, ParkingShiftRepository {
    
    public func saveParkingShift(shift: ParkingShift) throws {
        
        
    }
    
    public func getParkingShift() throws -> [ParkingShift] { return [] }
    
    public func finishParkingShift(shift: ParkingShift) throws { }
    
    public func searchVehicle(withPlate plate: String) throws -> [ParkingShift] { return [] }
    
    public func searchParkingShift(withPlate plate: String) throws -> [ParkingShiftCoreEntity] {
        let parkingsSaved = try getFetch(withPredicate: "departureDate == nil")
        let parkingSavedWithSamePlate = parkingsSaved.filter({$0.vehicle?.plate == plate})
        return parkingSavedWithSamePlate
    }
    
    public func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool {
        let parkingsSaved = try getFetch(withPredicate: "departureDate == nil")
        let carParkingSaved = parkingsSaved.filter({$0.vehicle is CarCoreEntity})
        if let _ = carParkingSaved.first(where: {$0.vehicle?.plate == plate}) {
            return true
        } else {
            return false
        }
    }
    
}
