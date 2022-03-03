//
//  MotorcycleCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/02/22.
//
//

import CoreData

extension MotorcycleCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MotorcycleCoreEntity> {
        return NSFetchRequest<MotorcycleCoreEntity>(entityName: "MotorcycleCoreEntity")
    }

    @NSManaged public var cylinderCapacity: Int32
}
