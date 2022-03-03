//
//  MotorcycleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class MotorcycleParkingShiftTranslator: VehicleParkingShiftTranslator {
    
    public override func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingShiftPayment: ParkingShiftPayment) throws -> NSManagedObject {
        let context = manager.persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let motorcycle = NSEntityDescription.insertNewObject(forEntityName: "MotorcycleCoreEntity", into: context) as! MotorcycleCoreEntity

        guard let motorcycleParkingShiftPayment = parkingShiftPayment as? MotorcycleParkingShiftPayment else { throw InfrastructureErrors.ErrorSavingParking()}
        guard let motorcycleParkingShift = motorcycleParkingShiftPayment.getParkingShift() as? MotorcycleParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        motorcycle.plate = motorcycleParkingShift.getMotorcycle()?.getPlate()
        motorcycle.cylinderCapacity = Int32(motorcycleParkingShift.getMotorcycle()?.getCylinderCapacity() ?? 0)
        parking.uid = motorcycleParkingShift.getId()
        parking.admissonDate = motorcycleParkingShift.getAdmissionDate()
        do {
            parking.departureDate = try motorcycleParkingShift.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = motorcycle
        parking.value = "\(try motorcycleParkingShiftPayment.calculateParkingShiftPrice())"
        return parking
    }
    
    public override func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let context = manager.persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let motorcycle = NSEntityDescription.insertNewObject(forEntityName: "MotorcycleCoreEntity", into: context) as! MotorcycleCoreEntity
    
        guard let motorcycleParkingDomain = parkingDomain as? MotorcycleParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        motorcycle.plate = motorcycleParkingDomain.getMotorcycle()?.getPlate()
        motorcycle.cylinderCapacity = Int32(motorcycleParkingDomain.getMotorcycle()?.getCylinderCapacity() ?? 0)
        parking.uid = motorcycleParkingDomain.getId()
        parking.admissonDate = motorcycleParkingDomain.getAdmissionDate()
        do {
            parking.departureDate = try motorcycleParkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = motorcycle
        return parking
    }
    
    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntity: ParkingShiftCoreEntity) throws -> MotorcycleParkingShift? {
        guard let motorcycleCoreEntity = parkingCoreEntity.vehicle as? MotorcycleCoreEntity else {
            return nil}
        guard let plate = motorcycleCoreEntity.plate,
              let admissionDate = parkingCoreEntity.admissonDate,
              let uid = parkingCoreEntity.uid else {
            return nil
        }
        
        let capacity = Int(motorcycleCoreEntity.cylinderCapacity)
        
        let motorcycle = try Motorcycle(plate: plate, cylinderCapacity: capacity)
        if let departureDate = parkingCoreEntity.departureDate {
            return try MotorcycleParkingShift(uid: uid, admissionDate: admissionDate, departureDate: departureDate, motorcycle: motorcycle)
        } else {
            return try MotorcycleParkingShift(uid: uid, admissionDate: admissionDate, motorcycle: motorcycle)
        }
    }
    
    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShift] {
        var motorcycleParkingShiftArray: [MotorcycleParkingShift] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromCoreToDomainEntity(manager, itemCore) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }
    
    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShiftPayment] {
        var motorcycleParkingShiftArrayPayments: [ParkingShiftPayment] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain: MotorcycleParkingShift = try fromCoreToDomainEntity(manager, itemCore) {
                let payment = MotorcycleParkingShiftPayment(parkingShift: itemDomain)
                motorcycleParkingShiftArrayPayments.append(payment)
            }
        }
        return motorcycleParkingShiftArrayPayments
    }
}

