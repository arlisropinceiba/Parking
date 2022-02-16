//
//  CarParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class CarParkingShiftTranslator : VehicleParkingShiftTranslator {
    
    public override func fromDomainToCoreEntity(_ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let context = persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let car = NSEntityDescription.insertNewObject(forEntityName: "CarCoreEntity", into: context) as! CarCoreEntity
    
        guard let carParkingDomain = parkingDomain as? CarParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        car.plate = carParkingDomain.getCar()?.getPlate()
        parking.id = carParkingDomain.getId()
        parking.admissionDate = carParkingDomain.getAdmissionDate()
        parking.vehicle = car
        do {
            parking.departureDate = try carParkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        return parking
    }

    public override func fromCoreToDomainEntity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> CarParkingShift? {
        guard let plate = parkingCoreEntity.vehicle?.plate,
              let admissionDate = parkingCoreEntity.admissionDate else {
            return nil
        }
        let car = try Car(plate: plate)
        if let departureDate = parkingCoreEntity.departureDate {
            return try CarParkingShift(admissionDate: admissionDate, departureDate: departureDate, car: car)
        } else {
            return try CarParkingShift(admissionDate: admissionDate, car: car)
        }
    }
    
    public func fromCoreToDomainEntity(_ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [CarParkingShift] {
        var carParkingShiftArray: [CarParkingShift] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromCoreToDomainEntity(itemCore) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }
}
