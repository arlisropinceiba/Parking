//
//  MotorcycleVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class MotorcycleVisibleTranslator : VehicleVisibleTranslator {
    
    override func fromDomainToVisibleEntity(_ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        if let motorcycleParkingShift = parkingDomainEntity as? MotorcycleParkingShift {
            return MotorcycleVisible(id: motorcycleParkingShift.getId(), plate: motorcycleParkingShift.getMotorcycle()?.getPlate() ?? "", admissionDate: motorcycleParkingShift.getAdmissionDate())}
        return nil
    }
    
    override func fromDomainToVisibleEntity(_ parkingDomainEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        var motorcycleVisibleArray: [VehicleVisible] = []
        for itemDomain in parkingDomainEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemDomain) {
                motorcycleVisibleArray.append(itemDomain)
            }
        }
        return motorcycleVisibleArray
    }
}
