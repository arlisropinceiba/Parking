//
//  ParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class ParkingCoreDataRepository: ParkingShiftRepository {
     
    var coreDataManager: CoreDataManager = CoreDataManager()
    var translator: VehicleParkingShiftTranslator = VehicleParkingShiftTranslator()
    
    init (translator: VehicleParkingShiftTranslator) {
        self.translator = translator
    }
    
    public func saveParkingShift(shift: ParkingShift) throws {
        let context = coreDataManager.persistentContainer.viewContext
        _ = try translator.fromDomainToCoreEntity(shift)
    
        do {
            try context.save()
            print("Parking saved succesfuly")
        } catch _ {
            throw InfrastructureErrors.errorSavingParking()
        }
    }
    
    public func getParkingShift() throws -> [ParkingShift] {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let parkingShiftDomainArray: [ParkingShift] = try translator.fromCoreToDomainEntity(parkingShiftsSaved)
        return parkingShiftDomainArray
    }
    
    public func searchVehicle(withPlate plate: String) throws -> [ParkingShift] {
        let parkingShiftSaved = try searchParkingShift(withPlate: plate)
        let carParkingShiftDomainArray: [ParkingShift] = try translator.fromCoreToDomainEntity(parkingShiftSaved)
        return carParkingShiftDomainArray
    }
    
    public func finishParkingShift(shift: ParkingShift) throws {
        
    }

    
    public func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool { // Corregir
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let carParkingSaved = parkingShiftsSaved.filter({$0.vehicle is CarCoreEntity})
        if let _ = carParkingSaved.first(where: {$0.vehicle?.plate == plate}) {
            return true
        } else {
            return false
        }
    }
    
    private func getFetchActiveParkingShifts() throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try coreDataManager.getFetch(withPredicate: "departureDate == nil")
        return parkingShiftsSaved
    }
    
    private func searchParkingShift(withPlate plate: String) throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let parkingSavedWithSamePlate = parkingShiftsSaved.filter({$0.vehicle?.plate == plate})
        return parkingSavedWithSamePlate
    }
}
