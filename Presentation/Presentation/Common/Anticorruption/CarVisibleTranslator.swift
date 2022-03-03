//
//  CarVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class CarVisibleTranslator: VehicleVisibleTranslator {
    
    public override func fromVisibleToDomainEntity(
        _ vehicleVisible: VehicleVisible) throws -> ParkingShiftPayment? {
        guard let carVisible = vehicleVisible as? CarVisible else {
            return nil
        }
        let car = try Car(
            plate: carVisible.getPlate())
        let shift = try CarParkingShift(
            uid: vehicleVisible.getId(),
            admissionDate: vehicleVisible.getAdmissionDate(),
            departureDate: Date(),
            car: car)
        let payment = CarParkingShiftPayment(parkingShift: shift)
        return payment
    }
    
    public override func fromVisibleToDomainEntity(_ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        guard let carVisible = vehicleVisible as? CarVisible else {
            return nil
        }
        let car = try Car(plate: carVisible.getPlate())
        return try CarParkingShift(
            uid: vehicleVisible.getId(),
            admissionDate: Date(),
            car: car)
    }
    
    public override func fromDomainToVisibleEntity(
        _ parkingShiftPayment: ParkingShiftPayment) throws -> VehicleVisible? {
        if let carParkingShiftPayment = parkingShiftPayment as? CarParkingShiftPayment,
            let carParkingShift = carParkingShiftPayment.getParkingShift() as? CarParkingShift {
            return CarVisible(
                uid: carParkingShift.getId(),
                plate: carParkingShift.getCar()?.getPlate() ?? "...",
                admissionDate: carParkingShift.getAdmissionDate(),
                departureDate: try carParkingShift.getDepartureDate(),
                valor: "\(try carParkingShiftPayment.calculateParkingShiftPrice())")
        }
        return nil
    }
    
    public override func fromDomainToVisibleEntity(
        _ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        if let carParkingShift = parkingDomainEntity as? CarParkingShift {
            return CarVisible(
                uid: carParkingShift.getId(),
                plate: carParkingShift.getCar()?.getPlate() ?? "",
                admissionDate: carParkingShift.getAdmissionDate())}
        return nil
    }

    public override func fromDomainToVisibleEntity(
        _ parkingCoreEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        var carParkingShiftArray: [VehicleVisible] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }
    
    public override func fromDomainToVisibleEntity(
        _ parkingCoreEntityArray: [ParkingShiftPayment]) throws -> [VehicleVisible] {
        var carParkingShiftArray: [VehicleVisible] = []
        for itemCore in parkingCoreEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                carParkingShiftArray.append(itemDomain)
            }
        }
        return carParkingShiftArray
    }
}
