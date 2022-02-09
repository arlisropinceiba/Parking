//
//  MotorcycleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class MotorcycleParkingShiftTranslator: VehicleParkingShiftTranslator {
    
    public func fromDomainToCoreEntity(_ parkingDomain: MotorcycleParkingShift) throws -> NSManagedObject {
        let context = persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingCoreEntity", into: context) as! ParkingShiftCoreEntity
        let motorcycle = NSEntityDescription.insertNewObject(forEntityName: "MotorcycleCoreEntity", into: context) as! MotorcycleCoreEntity
    
        motorcycle.plate = parkingDomain.getMotorcycle()?.getPlate()
        motorcycle.cylinderCapacity = Int16(parkingDomain.getMotorcycle()?.getCylinderCapacity() ?? 0)
        
        parking.id = parkingDomain.getId()
        parking.admissionDate = parkingDomain.getAdmissionDate()
        do {
            parking.departureDate = try parkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = motorcycle
        return parking
    }
    
    public override func fromCoreToDomainEnitity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> MotorcycleParkingShift? {
        guard let plate = parkingCoreEntity.vehicle?.plate,
                let admissionDate = parkingCoreEntity.admissionDate
        else {
            return nil
        }
        let capacity = Int((parkingCoreEntity.vehicle as? MotorcycleCoreEntity)?.cylinderCapacity ?? 0)
        
        let motorcycle = try Motorcycle(plate: plate, cylinderCapacity: capacity)
        if let departureDate = parkingCoreEntity.departureDate {
            return try MotorcycleParkingShift(admissionDate: admissionDate, departureDate: departureDate, motorcycle: motorcycle)
        } else {
            return try MotorcycleParkingShift(admissionDate: admissionDate, motorcycle: motorcycle)
        }
    }
}

