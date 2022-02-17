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
    let carRepository = CarParkingCoreDataRepository()
    let motorcycleRepository = MotorcycleParkingCoreDataRepository()

    func loadData(withThisType type: VehicleType) throws {
        var vehicles: [VehicleVisible] = []
        switch type {
        case .car: vehicles = try fetchCarsData()
        case .motorcycle: vehicles = try fetchMotorcyclesData()
        }
        presenter?.refreshData(with: vehicles)
    }
    
    func fetchCarsData() throws -> [VehicleVisible] {
        let translator = CarVisibleTranslator()
        let service = CarParkingShiftService(carParkingShiftRepository: carRepository)
        let parkingShifts = try service.getFinalizedParkingShifts()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchMotorcyclesData() throws -> [VehicleVisible] {
        let translator = MotorcycleVisibleTranslator()
        let service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository: motorcycleRepository)
        let parkingShifts = try service.getFinalizedParkingShifts()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
}

