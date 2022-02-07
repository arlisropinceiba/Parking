//
//  CarCoreEntity+CoreDataProperties.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//
//

import Foundation
import CoreData


extension CarCoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarCoreEntity> {
        return NSFetchRequest<CarCoreEntity>(entityName: "CarCoreEntity")
    }


}
