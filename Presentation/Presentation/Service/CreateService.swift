//
//  LocalService.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/02/22.
//

import Infrastructure
import Domain

extension LocalService {
    
    func createParkingShift(vehicle: VehicleVisible) async throws{
        guard let parkingShift: ParkingShift = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.saveThis(shift: parkingShift)
    }
    
}
