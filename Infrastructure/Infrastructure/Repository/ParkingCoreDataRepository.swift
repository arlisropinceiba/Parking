//
//  ParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class ParkingCoreDataRepository: CoreDataManager {
        
    public func saveParkingShift(shift: ParkingShift) {
        
    }
    
    public func getParkingShift() -> [ParkingShift] {
        return []
    }
    
    public func finishParkingShift(shift: ParkingShift) { }
    
    public func searchVehicle(withPlate plate: String) -> [ParkingShift] {
        return []
    }
    
    public func isThereAVehicleWithActiveParkingShift() -> Bool {
        return false
    }
}
