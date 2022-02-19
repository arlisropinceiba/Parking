//
//  LogHistoryInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Infrastructure
import Domain

class LogHistoryInteractor: LogHistoryInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: LogHistoryInteractorOutputProtocol?

    func getService(withThisType type: VehicleType) -> (LocalService) {
        switch type {
        case .car:
            return LocalService(translator: CarVisibleTranslator(), service: CarParkingShiftService(carParkingShiftRepository: CarParkingCoreDataRepository.shared))
        case .motorcycle:
            return LocalService(translator: MotorcycleVisibleTranslator(), service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository: MotorcycleParkingCoreDataRepository.shared))
        }
    }
    
    func fetchData(withThisType type: VehicleType) throws {
        let service = getService(withThisType: type)
        let vehicles: [VehicleVisible] = try service.fetchLog()
        presenter?.refreshData(with: vehicles)
    }
}

