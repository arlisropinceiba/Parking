//
//  ParkingRepositorty.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import Domain

public class ParkingCoreDataRepositorty: ParkingShiftRepository {
    
    public static let shared = ParkingCoreDataRepositorty()
    
    public func saveParkingShift(shift: ParkingShift) { }
    
    public func getParkingShift() -> [ParkingShift] {
        return []
    }
    
    public func getCountOfVehicles () -> Int {
        return 0
    }
    
    public func finishParkingShift(shift: ParkingShift) { }
    
    public func searchVehicle(withPlate plate: String) -> [ParkingShift] {
        return []
    }
    
    public func isThereAVehicleWithActiveParkingShift() -> Bool {
        return false
    }
    
}
