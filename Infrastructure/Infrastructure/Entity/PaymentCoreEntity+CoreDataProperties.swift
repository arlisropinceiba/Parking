//
//  PaymentCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//
//

import Foundation
import CoreData


extension PaymentCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaymentCoreEntity> {
        return NSFetchRequest<PaymentCoreEntity>(entityName: "PaymentCoreEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var value: Int16
    @NSManaged public var parkingShift: ParkingShiftCoreEntity?

}

extension PaymentCoreEntity : Identifiable {

}
