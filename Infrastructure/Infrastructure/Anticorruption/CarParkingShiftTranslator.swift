//
//  CarParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class CarParkingShiftTranslator: VehicleParkingShiftTranslator {
    
    public override func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingShiftPayment: ParkingShiftPayment) throws -> NSManagedObject {
        let context = manager.persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let car = NSEntityDescription.insertNewObject(forEntityName: "CarCoreEntity", into: context) as! CarCoreEntity

        guard let carParkingShiftPayment = parkingShiftPayment as? CarParkingShiftPayment else { throw InfrastructureErrors.ErrorSavingParking()}
        guard let carParkingShift = carParkingShiftPayment.getParkingShift() as? CarParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        car.plate = carParkingShift.getCar()?.getPlate()
        parking.uid = carParkingShift.getId()
        parking.admissonDate = carParkingShift.getAdmissionDate()
        parking.vehicle = car
        do {
            parking.departureDate = try carParkingShift.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.value = "\(try carParkingShiftPayment.calculateParkingShiftPrice())"
        return parking
    }
    
    public override func fromDomainToCoreEntity(_ manager: CoreDataManager, _ parkingDomain: ParkingShift) throws -> NSManagedObject {
        let context = manager.persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let car = NSEntityDescription.insertNewObject(forEntityName: "CarCoreEntity", into: context) as! CarCoreEntity
    
        guard let carParkingDomain = parkingDomain as? CarParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        car.plate = carParkingDomain.getCar()?.getPlate()
        parking.uid = carParkingDomain.getId()
        parking.admissonDate = carParkingDomain.getAdmissionDate()
        parking.vehicle = car
        do {
            parking.departureDate = try carParkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        return parking
    }

    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntity: ParkingShiftCoreEntity) throws -> CarParkingShift? {
        guard let plate = parkingCoreEntity.vehicle?.plate,
              let admissionDate = parkingCoreEntity.admissonDate,
              let uid = parkingCoreEntity.uid,
                parkingCoreEntity.vehicle is CarCoreEntity else {
            return nil
        }
        let car = try Car(plate: plate)
        if let departureDate = parkingCoreEntity.departureDate {
            return try CarParkingShift(uid: uid, admissionDate: admissionDate, departureDate: departureDate, car: car)
        } else {
            return try CarParkingShift(uid: uid, admissionDate: admissionDate, car: car)
        }
    }
    
    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShift] {
        var carParkingShiftArray: [CarParkingShift] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain: CarParkingShift = try fromCoreToDomainEntity(manager, itemCore) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }

    public override func fromCoreToDomainEntity(_ manager: CoreDataManager, _ parkingCoreEntityArray: [ParkingShiftCoreEntity]) throws -> [ParkingShiftPayment] {
        var carParkingShiftArrayPayments: [ParkingShiftPayment] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain: CarParkingShift = try fromCoreToDomainEntity(manager, itemCore) {
                let payment = CarParkingShiftPayment(parkingShift: itemDomain)
                carParkingShiftArrayPayments.append(payment)
            }
        }
        return carParkingShiftArrayPayments
    }
}
