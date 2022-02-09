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
    
    public func saveParkingShift(shift: CarParkingShift) throws {
        try super.saveParkingShift(shift: shift)
    }
    
    public override func getParkingShift() -> [ParkingShift] {
        return []
    }
    
    public func getCountOfCars () throws -> Int {
        let parkingsSaved = try getFetch(withPredicate: "departureDate == nil")
        let carParkingsSaved = parkingsSaved.filter({$0.vehicle is CarCoreEntity})
        return carParkingsSaved.count
    }
    
    public override func finishParkingShift(shift: ParkingShift) { }
    
    public func searchVehicle(withPlate plate: String) throws -> [CarParkingShift] {
        let parkingShiftSaved = try searchParkingShift(withPlate: plate)
        let traslator = CarParkingShiftTranslator()
        let carParkingShiftDomainArray: [CarParkingShift] = try traslator.fromCoreToDomainEntity(parkingShiftSaved)
        return carParkingShiftDomainArray
    }
}
