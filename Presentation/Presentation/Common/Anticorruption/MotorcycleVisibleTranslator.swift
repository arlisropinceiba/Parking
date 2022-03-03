//
//  MotorcycleVisibleTranslator.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Domain

class MotorcycleVisibleTranslator: VehicleVisibleTranslator {
    
    public override func fromVisibleToDomainEntity(
        _ vehicleVisible: VehicleVisible) throws -> ParkingShiftPayment? {
        guard let motorcycleVisible = vehicleVisible as? MotorcycleVisible else {
            return nil
        }
        let motorcycle = try Motorcycle(
            plate: motorcycleVisible.getPlate(),
            cylinderCapacity: motorcycleVisible.getCylinderCapacity())
        let shift = try MotorcycleParkingShift(
            uid: vehicleVisible.getId(),
            admissionDate: vehicleVisible.getAdmissionDate(),
            departureDate: vehicleVisible.getDepartureDate(),
            motorcycle: motorcycle)
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        return payment
    }
    
    public override func fromVisibleToDomainEntity(
        _ vehicleVisible: VehicleVisible) throws -> ParkingShift? {
        guard let motorcycleVisible = vehicleVisible as? MotorcycleVisible else {
            return nil
        }
        let motorcycle = try Motorcycle(
            plate: motorcycleVisible.getPlate(),
            cylinderCapacity: motorcycleVisible.getCylinderCapacity())
        return try MotorcycleParkingShift(
            uid: vehicleVisible.getId(),
            admissionDate: Date(),
            motorcycle: motorcycle)
    }
    
    public override func fromDomainToVisibleEntity(
        _ parkingShiftPayment: ParkingShiftPayment) throws -> VehicleVisible? {
        if let motorcycleParkingShiftPayment = parkingShiftPayment as? MotorcycleParkingShiftPayment,
            let motorcycleParkingShift = motorcycleParkingShiftPayment.getParkingShift() as? MotorcycleParkingShift {
            return MotorcycleVisible(
                uid: motorcycleParkingShift.getId(),
                plate: motorcycleParkingShift.getMotorcycle()?.getPlate() ?? "...",
                admissionDate: motorcycleParkingShift.getAdmissionDate(),
                cylinderCapacity: motorcycleParkingShift.getMotorcycle()?.getCylinderCapacity() ?? 0 ,
                departureDate: try motorcycleParkingShift.getDepartureDate(),
                valor: "\(try motorcycleParkingShiftPayment.calculateParkingShiftPrice())")
        }
        return nil
    }
    
    public override func fromDomainToVisibleEntity(
        _ parkingDomainEntity: ParkingShift) throws -> VehicleVisible? {
        if let motorcycleParkingShift = parkingDomainEntity as? MotorcycleParkingShift {
            return MotorcycleVisible(
                uid: motorcycleParkingShift.getId(),
                plate: motorcycleParkingShift.getMotorcycle()?.getPlate() ?? "",
                admissionDate: motorcycleParkingShift.getAdmissionDate(),
                cylinderCapacity: motorcycleParkingShift.getMotorcycle()?.getCylinderCapacity() ?? 0)}
        return nil
    }

    public override func fromDomainToVisibleEntity(
        _ parkingDomainEntityArray: [ParkingShift]) throws -> [VehicleVisible] {
        var motorcycleParkingShiftArray: [VehicleVisible] = []
        for itemCore in parkingDomainEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }
    
    public override func fromDomainToVisibleEntity(
        _ paymentDomainEntityArray: [ParkingShiftPayment]) throws -> [VehicleVisible] {
        var motorcycleParkingShiftArray: [VehicleVisible] = []
        for itemCore in paymentDomainEntityArray {
            if let itemDomain = try fromDomainToVisibleEntity(itemCore) {
                motorcycleParkingShiftArray.append(itemDomain)
            }
        }
        return motorcycleParkingShiftArray
    }
}
