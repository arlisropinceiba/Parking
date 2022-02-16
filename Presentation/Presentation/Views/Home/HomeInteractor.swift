//
//  HomeInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import Infrastructure
import Domain

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?

    func createCarPakingShift(car: CarVisible) async throws {
        let translator = CarVisibleTranslator()
        guard let parkingShift = try translator.fromVisibleToDomainEntity(car) else {
            throw PresentationErrors.ErrorFetchParkings()}
        try await CarParkingCoreDataRepository.shared.saveParkingShift(shift: parkingShift)
        try loadData(withThisType: .car)
    }
    
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
        let parkingShifts = try CarParkingCoreDataRepository.shared.getParkingShift()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchMotorcyclesData() throws -> [VehicleVisible] {
        let translator = MotorcycleVisibleTranslator()
        let parkingShifts = try MotorcycleParkingCoreDataRepository.shared.getParkingShift()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
}
