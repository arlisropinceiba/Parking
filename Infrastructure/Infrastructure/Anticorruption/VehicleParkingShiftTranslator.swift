//
//  VehicleParkingShiftTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import Domain

class VehicleParkingShiftTranslator {

    public func fromDomainToDataBaseEntity(_ parkingDomain: ParkingShift) throws -> ParkingShiftDataBaseEntity {
        let parking = ParkingShiftDataBaseEntity()
        return parking
    }

    public func fromDomainToDataBaseEntity(_ parkingDomain: ParkingShiftPayment) throws -> ParkingShiftDataBaseEntity {
        let parking = ParkingShiftDataBaseEntity()
        return parking
    }

    public func fromDataBaseToDomainEntity(_ parkingDataBaseEntity: ParkingShiftDataBaseEntity) throws -> ParkingShift? {
        return nil
    }

    public func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShift] {
        return []
    }

    public func fromDataBaseToDomainEntity(_ parkingDataBaseEntityArray: [ParkingShiftDataBaseEntity]) throws -> [ParkingShiftPayment] {
        return []
    }
}
