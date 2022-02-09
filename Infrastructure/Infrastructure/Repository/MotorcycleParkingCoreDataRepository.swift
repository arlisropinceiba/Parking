//
//  MotorcycleParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class MotorcycleParkingCoreDataRepository: ParkingCoreDataRepository, MotorcycleParkingShiftRepository {
    
    public static let shared = MotorcycleParkingCoreDataRepository()
    
    public override func saveParkingShift(shift: ParkingShift) { }
    
    public override func getParkingShift() -> [ParkingShift] {
        return []
    }
    
    public func getCountOfMotorcycles () throws -> Int {
        let parkingsSaved = try getFetch(withPredicate: "departureDate == nil")
        let carParkingsSaved = parkingsSaved.filter({$0.vehicle is MotorcycleCoreEntity})
        return carParkingsSaved.count
    }
    
    public override func finishParkingShift(shift: ParkingShift) { }
    
    public override func searchVehicle(withPlate plate: String) -> [ParkingShift] {
        return []
    }
    
    public override func isThereAVehicleWithActiveParkingShift() -> Bool {
        return false
    }
}
