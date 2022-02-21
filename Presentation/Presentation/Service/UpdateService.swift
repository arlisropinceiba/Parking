//
//  UpdateService.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 21/02/22.
//

import Infrastructure
import Domain

extension LocalService {
    func finishShift(vehicle: VehicleVisible) async throws -> VehicleVisible {
        guard let parkingShiftPayment: ParkingShiftPayment = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.finishParkingShift(shift: parkingShiftPayment)
        
        guard let vehicleVisible: VehicleVisible = try translator.fromDomainToVisibleEntity(parkingShiftPayment) else {
            return vehicle}
        return vehicleVisible
    }
}
