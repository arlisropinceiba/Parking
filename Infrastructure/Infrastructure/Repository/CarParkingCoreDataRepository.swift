//
//  CarParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class CarParkingCoreDataRepository: ParkingCoreDataRepository, CarParkingShiftRepository {
 
    public static let shared = CarParkingCoreDataRepository()
    
    public override func saveParkingShift(shift: ParkingShift) { }
    
    public override func getParkingShift() -> [ParkingShift] {
        return []
    }
    
    public func getCountOfCars () throws -> Int {
        let parkingsSaved = try getFetch(withPredicate: "departureDate == nil")
        let carParkingsSaved = parkingsSaved.filter({$0.vehicle is CarCoreEntity})
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
