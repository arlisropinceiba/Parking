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
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingCoreEntity", into: context) as! ParkingShiftCoreEntity
        let motorcycle = NSEntityDescription.insertNewObject(forEntityName: "MotorcycleCoreEntity", into: context) as! MotorcycleCoreEntity
    
        motorcycle.plate = parkingDomain.getVehicle().getPlate()
        if parkingDomain.getVehicle() is Motorcycle {
            motorcycle.cylinderCapacity = Int16((parkingDomain.getVehicle() as! Motorcycle).getCylinderCapacity())
        }
        parking.id = parkingDomain.getId()
        parking.admissionDate = parkingDomain.getAdmission
        do {
            parking.departureDate = try parkingDomain.getDeparture
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = motorcycle
        return parking
    }
    
    public override func fromCoreToDomainEnitity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> ParkingShift? {
        guard let plate = parkingCoreEntity.vehicle?.plate,
                let admissionDate = parkingCoreEntity.admissionDate
        else {
            return nil
        }
        var capacity = 0
        if parkingCoreEntity.vehicle is MotorcycleCoreEntity {
            capacity = Int((parkingCoreEntity.vehicle as! MotorcycleCoreEntity).cylinderCapacity)
        }
        let motorcycle = try Motorcycle(plate: plate, cylinderCapacity: capacity)
        if let departureDate = parkingCoreEntity.departureDate {
            return ParkingShift(admissionDate: admissionDate, departureDate: departureDate, vehicle: motorcycle)
        } else {
            return ParkingShift(admissionDate: admissionDate, vehicle: motorcycle)
        }
    }
}

