//
//  VehicleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class VehicleParkingShiftTranslator : CoreDataManager {
    
    public func fromDomainToCoreEntity(_ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let parking = NSManagedObject()
        return parking
    }
    
    public func fromCoreToDomainEnitity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> ParkingShift? {
        return nil
    }
    
}
