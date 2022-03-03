//
//  VehicleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class VehicleParkingShiftTranslator {

    public func fromDomainToCoreUpdate(_ manager: CoreDataManager, _ parkingDomain: ParkingShiftPayment, _ parkingCore: [ParkingShiftCoreEntity]) throws -> NSManagedObject? {
        if parkingCore.count == 1 {
            parkingCore[0].departureDate = try parkingDomain.getParkingShift().getDepartureDate()
            parkingCore[0].value = "\(try parkingDomain.calculateParkingShiftPrice())"
            return parkingCore[0]
        }
        return nil
    }
        
    public func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let parking = NSManagedObject()
        return parking
    }

    public func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingDomain: ParkingShiftPayment) throws -> NSManagedObject {
        let parking = NSManagedObject()
        return parking
    }

    public func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntity: ParkingShiftCoreEntity) throws -> ParkingShift? {
        return nil
    }

    public func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShift] {
        return []
    }

    public func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShiftPayment] {
        return []
    }
}
