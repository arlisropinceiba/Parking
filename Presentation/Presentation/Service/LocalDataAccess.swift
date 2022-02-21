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
    
    init(type: VehicleType) {
        switch type {
        case .car:
            translator = CarVisibleTranslator()
            service = CarParkingShiftService(carParkingShiftRepository: CarParkingCoreDataRepository.shared)
        case .motorcycle:
            translator = MotorcycleVisibleTranslator()
            service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository: MotorcycleParkingCoreDataRepository.shared)
        }
    }
}
