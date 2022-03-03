//
//  VehicleVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class VehicleVisibleTranslator {

    func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShiftPayment?{
        return nil
    }

    func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        return nil
    }

    func fromDomainToVisibleEntity(_ parkingShiftPayment: ParkingShiftPayment) throws -> VehicleVisible? {
        return nil
    }

    func fromDomainToVisibleEntity(_ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        return nil
    }

    func fromDomainToVisibleEntity(_ parkingCoreEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        return []
    }

    func fromDomainToVisibleEntity(_ parkingCoreEntityArray: [ParkingShiftPayment]) throws -> [VehicleVisible] {
        return []
    }
}
