//
//  LocalService.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/02/22.
//

import Infrastructure
import Domain

class LocalService {
    
    var translator: VehicleVisibleTranslator
    var service: ParkingShiftService
    
    init(translator: VehicleVisibleTranslator, service: ParkingShiftService) {
        self.translator = translator
        self.service = service
    }
    
    func fetchData() throws -> [VehicleVisible] {
        let parkingShifts = try service.getParkingShift()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchLog() throws -> [VehicleVisible] {
        let parkingShifts = try service.getFinalizedParkingShifts()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func finishShift(vehicle: VehicleVisible) async throws -> VehicleVisible {
        guard let parkingShiftPayment: ParkingShiftPayment = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.finishParkingShift(shift: parkingShiftPayment)
        
        guard let vehicleVisible: VehicleVisible = try translator.fromDomainToVisibleEntity(parkingShiftPayment) else {
            return vehicle}
        return vehicleVisible
    }
    
    func createParkingShift(vehicle: VehicleVisible) async throws{
        guard let parkingShift: ParkingShift = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.saveThis(shift: parkingShift)
    }
}
