//
//  CarVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class CarVisibleTranslator: VehicleVisibleTranslator {
    
    public override func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        guard let carVisible = vehicleVisible as? CarVisible else {
            return nil
        }
        let car = try Car(plate: carVisible.getPlate())
        return try CarParkingShift(admissionDate: Date(), car: car)
    }
    
    public override func fromDomainToVisibleEntity(_ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        if let carParkingShift = parkingDomainEntity as? CarParkingShift {
            return CarVisible(id: carParkingShift.getId(), plate: carParkingShift.getCar()?.getPlate() ?? "", admissionDate: carParkingShift.getAdmissionDate())}
        return nil
    }

    public override func fromDomainToVisibleEntity(_ parkingCoreEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        var carParkingShiftArray: [VehicleVisible] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }
}
