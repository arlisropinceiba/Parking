//
//  CarParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import RealmSwift
import Domain

class CarParkingShiftTranslator: VehicleParkingShiftTranslator {

    public override func fromDomainToDataBaseEntity(_ parkingShiftPayment: ParkingShiftPayment) throws -> ParkingShiftDataBaseEntity {
        
        guard let carParkingShiftPayment = parkingShiftPayment as? CarParkingShiftPayment
        else { throw InfrastructureErrors.ErrorSavingParking()}
        guard let carParkingShift = carParkingShiftPayment.getParkingShift() as? CarParkingShift
        else { throw InfrastructureErrors.ErrorSavingParking()}
        var departureDate: Date?
        do {
            departureDate = try carParkingShift.getDepartureDate()
        } catch {
            departureDate = nil
        }
        let parking = ParkingShiftDataBaseEntity(
            uid: carParkingShift.getId(),
            admissionDate: carParkingShift.getAdmissionDate(),
            departureDate: departureDate,
            value: "\(try carParkingShiftPayment.calculateParkingShiftPrice())",
            type: VehicleType.car.rawValue, plate: carParkingShift.getCar()?.getPlate()
        )
        return parking
    }

    public override func fromDomainToDataBaseEntity(_ parkingDomain: ParkingShift) throws -> ParkingShiftDataBaseEntity {
        guard let carParkingDomain = parkingDomain as? CarParkingShift else { throw InfrastructureErrors.ErrorSavingParking()}
        var departureDate: Date?
        do {
            departureDate = try carParkingDomain.getDepartureDate()
        } catch {
            departureDate = nil
        }
        let parking = ParkingShiftDataBaseEntity(
            uid: carParkingDomain.getId(),
            admissionDate: carParkingDomain.getAdmissionDate(),
            departureDate: departureDate,
            type: VehicleType.car.rawValue,
            plate: carParkingDomain.getCar()?.getPlate()
        )
        return parking
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntity: ParkingShiftDataBaseEntity) throws -> CarParkingShift? {
        guard let plate = parkingDataBaseEntity.plate,
              let admissionDate = parkingDataBaseEntity.admissionDate,
              let uid = parkingDataBaseEntity.uid,
              parkingDataBaseEntity.type == VehicleType.car.rawValue else {
            return nil
        }
        let car = try Car(plate: plate)
        if let departureDate = parkingDataBaseEntity.departureDate {
            return try CarParkingShift(uid: uid, admissionDate: admissionDate, departureDate: departureDate, car: car)
        } else {
            return try CarParkingShift(uid: uid, admissionDate: admissionDate, car: car)
        }
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShift] {
        var carParkingShiftArray: [CarParkingShift] = []
        for itemDataBase in parkingDataBaseEntityArray {
            if let itemDomain: CarParkingShift = try fromDataBaseToDomainEntity(itemDataBase) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }

    public override func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShiftPayment] {
        var carParkingShiftArrayPayments: [ParkingShiftPayment] = []
        for itemDataBase in parkingDataBaseEntityArray {
            if let itemDomain: CarParkingShift = try fromDataBaseToDomainEntity(itemDataBase) {
                let payment = CarParkingShiftPayment(parkingShift: itemDomain)
                carParkingShiftArrayPayments.append(payment)
            }
        }
        return carParkingShiftArrayPayments
    }
}
