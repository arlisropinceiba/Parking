//
//  MotorcycleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import RealmSwift
import Domain

class MotorcycleParkingShiftTranslator: VehicleParkingShiftTranslator {

    public override func fromDomainToDataBaseEntity(_ parkingShiftPayment: ParkingShiftPayment) throws -> ParkingShiftDataBaseEntity {
        let parking = ParkingShiftDataBaseEntity()
    
        guard let motorcycleParkingShiftPayment = parkingShiftPayment as? MotorcycleParkingShiftPayment else { throw InfrastructureErrors.ErrorSavingParking()}
        guard let motorcycleParkingShift = motorcycleParkingShiftPayment.getParkingShift() as? MotorcycleParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
    
        parking.plate = motorcycleParkingShift.getMotorcycle()?.getPlate()
        parking.cylinderCapacity = motorcycleParkingShift.getMotorcycle()?.getCylinderCapacity() ?? 0
        parking.uid = motorcycleParkingShift.getId()
        parking.admissionDate = motorcycleParkingShift.getAdmissionDate()
        parking.type = VehicleType.motorcycle.rawValue
        do {
            parking.departureDate = try motorcycleParkingShift.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        parking.value = "\(try motorcycleParkingShiftPayment.calculateParkingShiftPrice())"
        return parking
    }

    public override func fromDomainToDataBaseEntity(_ parkingDomain: ParkingShift) throws -> ParkingShiftDataBaseEntity {
        let parking = ParkingShiftDataBaseEntity()

        guard let motorcycleParkingDomain = parkingDomain as? MotorcycleParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        parking.plate = motorcycleParkingDomain.getMotorcycle()?.getPlate()
        parking.cylinderCapacity = motorcycleParkingDomain.getMotorcycle()?.getCylinderCapacity() ?? 0
        parking.uid = motorcycleParkingDomain.getId()
        parking.admissionDate = motorcycleParkingDomain.getAdmissionDate()
        parking.type = VehicleType.motorcycle.rawValue
        do {
            parking.departureDate = try motorcycleParkingDomain.getDepartureDate()
        } catch {
            parking.departureDate = nil
        }
        return parking
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntity: ParkingShiftDataBaseEntity) throws -> MotorcycleParkingShift? {
        guard let plate = parkingDataBaseEntity.plate,
              let admissionDate = parkingDataBaseEntity.admissionDate,
              let uid = parkingDataBaseEntity.uid,
              parkingDataBaseEntity.type == VehicleType.motorcycle.rawValue else {
            return nil
        }

        let capacity = Int(parkingDataBaseEntity.cylinderCapacity)

        let motorcycle = try Motorcycle(plate: plate, cylinderCapacity: capacity)
        if let departureDate = parkingDataBaseEntity.departureDate {
            return try MotorcycleParkingShift(uid: uid, admissionDate: admissionDate, departureDate: departureDate, motorcycle: motorcycle)
        } else {
            return try MotorcycleParkingShift(uid: uid, admissionDate: admissionDate, motorcycle: motorcycle)
        }
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShift] {
        var motorcycleParkingShiftArray: [MotorcycleParkingShift] = []
        for itemDataBase in parkingDataBaseEntityArray {
            if let itemDomain = try fromDataBaseToDomainEntity(itemDataBase) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShiftPayment] {
        var motorcycleParkingShiftArrayPayments: [ParkingShiftPayment] = []
        for itemDataBase in parkingDataBaseEntityArray {
            if let itemDomain: MotorcycleParkingShift = try fromDataBaseToDomainEntity(itemDataBase) {
                let payment = MotorcycleParkingShiftPayment(parkingShift: itemDomain)
                motorcycleParkingShiftArrayPayments.append(payment)
            }
        }
        return motorcycleParkingShiftArrayPayments
    }
}

