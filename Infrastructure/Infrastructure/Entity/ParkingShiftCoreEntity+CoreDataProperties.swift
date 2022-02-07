//
//  ParkingShiftCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//
//

import Foundation
import CoreData


extension ParkingShiftCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ParkingShiftCoreEntity> {
        return NSFetchRequest<ParkingShiftCoreEntity>(entityName: "ParkingShiftCoreEntity")
    }

    @NSManaged public var admissionDate: Date?
    @NSManaged public var departureDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var vehicle: VehicleCoreEntity?
    @NSManaged public var payment: PaymentCoreEntity?

}

extension ParkingShiftCoreEntity : Identifiable {

}
