//
//  CarParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import CoreData
import Domain

class CarParkingShiftTranslator : VehicleParkingShiftTranslator {
    
    public func fromDomainToCoreEntity(_ parkingDomain: CarParkingShift) throws -> NSManagedObject {
        let context = persistentContainer.viewContext
        let parking = NSEntityDescription.insertNewObject(forEntityName: "ParkingShiftCoreEntity", into: context) as! ParkingShiftCoreEntity
        let car = NSEntityDescription.insertNewObject(forEntityName: "CarCoreEntity", into: context) as! CarCoreEntity
    
        car.plate = parkingDomain.getCar()?.getPlate()
        parking.id = parkingDomain.getId()
        parking.admissionDate = parkingDomain.getAdmissionDate()
        do {
            parking.departureDate = try parkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.vehicle = car
        return parking
    }
    
    public override func fromCoreToDomainEnitity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> CarParkingShift? {
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
}
