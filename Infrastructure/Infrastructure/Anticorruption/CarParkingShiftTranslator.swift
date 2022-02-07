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
    
        car.plate = parkingDomain.getVehicle().getPlate()
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
    
    public override func fromCoreToDomainEnitity(_ parkingCoreEntity: ParkingShiftCoreEntity) throws -> ParkingShift? {
        guard let plate = parkingCoreEntity.vehicle?.plate,
              let admissionDate = parkingCoreEntity.admissionDate else {
            return nil
        }
        let car = try Car(plate: plate)
        if let departureDate = parkingCoreEntity.departureDate {
            return ParkingShift(admissionDate: admissionDate, departureDate: departureDate, vehicle: car)
        } else {
            return ParkingShift(admissionDate: admissionDate, vehicle: car)
        }
    }
}
