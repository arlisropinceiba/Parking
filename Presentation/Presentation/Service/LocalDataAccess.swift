//
//  LocalDataAccess.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 21/02/22.
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

}
