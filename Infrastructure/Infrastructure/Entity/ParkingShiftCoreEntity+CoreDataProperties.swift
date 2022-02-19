//
//  ParkingShiftCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/02/22.
//
//

import Foundation
import CoreData


extension ParkingShiftCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ParkingShiftCoreEntity> {
        return NSFetchRequest<ParkingShiftCoreEntity>(entityName: "ParkingShiftCoreEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var admissonDate: Date?
    @NSManaged public var departureDate: Date?
    @NSManaged public var value: String?
    @NSManaged public var vehicle: VehicleCoreEntity?

}

extension ParkingShiftCoreEntity : Identifiable {

}
