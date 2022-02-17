//
//  ParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain
import CoreData

public class ParkingCoreDataRepository: ParkingShiftRepository {
    
    
    var coreDataManager = CoreDataManager()
    var translator: VehicleParkingShiftTranslator = VehicleParkingShiftTranslator()
    
    init (translator: VehicleParkingShiftTranslator) {
        self.translator = translator
    }
    
    public func saveParkingShift(shift: ParkingShift) async throws {
        let parkingShiftCore = try translator.fromDomainToCoreEntity(shift)
        print(parkingShiftCore)
        try await saveData(of: parkingShiftCore)
    }
    
    func saveData(of shift: NSManagedObject)  async throws  {
        let context = coreDataManager.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
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
    
    public func getFinalizedParkingShifts() throws -> [ParkingShift] {
        let parkingShiftsSaved = try coreDataManager.getFetchHistoricalParking()
        let parkingShiftDomainArray: [ParkingShift] = try translator.fromCoreToDomainEntity(parkingShiftsSaved)
        return parkingShiftDomainArray
    }
    
    public func searchVehicle(withPlate plate: String) throws -> [ParkingShift] {
        let parkingShiftSaved = try searchParkingShift(withPlate: plate)
        let carParkingShiftDomainArray: [ParkingShift] = try translator.fromCoreToDomainEntity(parkingShiftSaved)
        return carParkingShiftDomainArray
    }
    
    public func finishParkingShift(shift: ParkingShiftPayment) async throws {
        let parkingShiftCore = try translator.fromDomainToCoreEntity(shift)
        print(parkingShiftCore)
        try await saveData(of: parkingShiftCore)
    }

    public func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool {
        let pakingsSaved = try getFetchActiveParkingShifts()
        return pakingsSaved.first(where: {$0.vehicle?.plate == plate}) != nil
    }
    
    public func getFetchActiveParkingShifts() throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try coreDataManager.getFetchCurrentParking()
        return parkingShiftsSaved
    }
    
    private func searchParkingShift(withPlate plate: String) throws -> [ParkingShiftCoreEntity] {
        let parkingShiftsSaved = try coreDataManager.getFetchCurrentParking()
        let parkingSavedWithSamePlate = parkingShiftsSaved.filter({$0.vehicle?.plate == plate})
        return parkingSavedWithSamePlate
    }
}
