//
//  MotorcycleVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class MotorcycleVisibleTranslator: VehicleVisibleTranslator {
    
    public override func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        guard let motorcycleVisible = vehicleVisible as? MotorcycleVisible else {
            return nil
        }
        let motorcycle = try Motorcycle(plate: motorcycleVisible.getPlate(), cylinderCapacity: motorcycleVisible.getCylinderCapacity())
        return try MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: motorcycle)
    }
    
    public override func fromDomainToVisibleEntity(_ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        if let motorcycleParkingShift = parkingDomainEntity as? MotorcycleParkingShift {
            return MotorcycleVisible(id: motorcycleParkingShift.getId(), plate: motorcycleParkingShift.getMotorcycle()?.getPlate() ?? "", admissionDate: motorcycleParkingShift.getAdmissionDate())}
        return nil
    }

    public override func fromDomainToVisibleEntity(_ parkingCoreEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        var motorcycleParkingShiftArray: [VehicleVisible] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }
}
