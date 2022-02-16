//
//  VehicleVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class VehicleVisibleTranslator {
    
    func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        return nil
    }
    
    func fromDomainToVisibleEntity(_ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        return nil
    }
    
    func fromDomainToVisibleEntity(_ parkingCoreEntityArray: [ParkingShift]) throws -> [VehicleVisible]{
        return []
    }
}
