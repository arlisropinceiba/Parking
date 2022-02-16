//
//  ParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class ParkingCoreDataRepository: ParkingShiftRepository {
    
    var coreDataManager = CoreDataManager()
    var translator: VehicleParkingShiftTranslator = VehicleParkingShiftTranslator()
    
    init (translator: VehicleParkingShiftTranslator) {
        self.translator = translator
    }
    
    public func saveParkingShift(shift: ParkingShift) async throws {
        let context = coreDataManager.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        let parkingShiftCore = try translator.fromDomainToCoreEntity(shift)
        print(parkingShiftCore)
        try await context.perform {
            do {
                try context.save()
                print("Parking saved succesfuly")
            } catch let error {
                print("\nError saving context: \(error.localizedDescription)\n")
                throw InfrastructureErrors.ErrorSavingParking()
            }
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

    
    public func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool {
        if (try coreDataManager.getFetch(withPredicate: "departureDate == nil && plate == \(plate)")) != [] {
            return true
        } else {
            return false
        }
    }
    
    public func getFetchActiveParkingShifts() throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try coreDataManager.getFetch(withPredicate: "departureDate == nil")
        return parkingShiftsSaved
    }
    
    private func searchParkingShift(withPlate plate: String) throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try coreDataManager.getFetch(withPredicate: "plate != nil")
        let parkingSavedWithSamePlate = parkingShiftsSaved.filter({$0.vehicle?.plate == plate})
        return parkingSavedWithSamePlate
    }
}
