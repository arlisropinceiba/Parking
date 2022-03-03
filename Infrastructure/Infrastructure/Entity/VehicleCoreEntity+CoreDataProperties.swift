//
//  VehicleCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/02/22.
//
//

import Foundation
import CoreData

extension VehicleCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VehicleCoreEntity> {
        return NSFetchRequest<VehicleCoreEntity>(entityName: "VehicleCoreEntity")
    }

    @NSManaged public var plate: String?
    @NSManaged public var parkingShift: ParkingShiftCoreEntity?
}

extension VehicleCoreEntity: Identifiable {
}
