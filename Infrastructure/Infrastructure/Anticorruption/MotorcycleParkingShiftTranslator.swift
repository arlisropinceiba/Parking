//
//  MotorcycleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class MotorcycleParkingShiftTranslator: VehicleParkingShiftTranslator {
    
    public override func fromDomainToCoreEntity(_ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let context = persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let motorcycle = NSEntityDescription.insertNewObject(forEntityName: "MotorcycleCoreEntity", into: context) as! MotorcycleCoreEntity
    
        guard let motorcycleParkingDomain = parkingDomain as? MotorcycleParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        motorcycle.plate = motorcycleParkingDomain.getMotorcycle()?.getPlate()
        motorcycle.cylinderCapacity = Int32(motorcycleParkingDomain.getMotorcycle()?.getCylinderCapacity() ?? 0)
        parking.id = motorcycleParkingDomain.getId()
        parking.admissionDate = motorcycleParkingDomain.getAdmissionDate()
        do {
            parking.departureDate = try motorcycleParkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = motorcycle
        return parking
    }
    
    public override func fromCoreToDomainEntity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> MotorcycleParkingShift? {
        guard let motorcycleCoreEntity = parkingCoreEntity.vehicle as? MotorcycleCoreEntity else { throw InfrastructureErrors.ErrorFetchParkings()}
        guard let plate = motorcycleCoreEntity.plate,
                let admissionDate = parkingCoreEntity.admissionDate
        else {
            return nil
        }
        let capacity = Int(motorcycleCoreEntity.cylinderCapacity)
        
        let motorcycle = try Motorcycle(plate: plate, cylinderCapacity: capacity)
        if let departureDate = parkingCoreEntity.departureDate {
            return try MotorcycleParkingShift(admissionDate: admissionDate, departureDate: departureDate, motorcycle: motorcycle)
        } else {
            return try MotorcycleParkingShift(admissionDate: admissionDate, motorcycle: motorcycle)
        }
    }
    
    public func fromCoreToDomainEntity(_ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [MotorcycleParkingShift] {
        var motorcycleParkingShiftArray: [MotorcycleParkingShift] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromCoreToDomainEntity(itemCore) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }
}

