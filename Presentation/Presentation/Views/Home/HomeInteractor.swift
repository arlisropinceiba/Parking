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
    var localService: LocalService?
    
    func getService(withThisType type: VehicleType) -> (LocalService) {
        switch type {
        case .car:
            return LocalService(translator: CarVisibleTranslator(), service: CarParkingShiftService(carParkingShiftRepository: CarParkingCoreDataRepository.shared))
        case .motorcycle:
            return LocalService(translator: MotorcycleVisibleTranslator(), service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository: MotorcycleParkingCoreDataRepository.shared))
        }
    }
    
    func createParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws {
        let service = getService(withThisType: type)
        try await service.createParkingShift(vehicle: vehicle)
        try fetchData(withThisType: type)
    }
    
    func fetchData(withThisType type: VehicleType) throws {
        let service = getService(withThisType: type)
        let vehicles: [VehicleVisible] = try service.fetchData()
        presenter?.refreshData(with: vehicles)
    }
    
    func finishParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible {
        vehicle.setDepartureDate(Date())
        let service = getService(withThisType: type)
        let vehicleVisible = try await service.finishShift(vehicle: vehicle)
        try fetchData(withThisType: type)
        return vehicleVisible
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        let service = getService(withThisType: type)
        let vehicles: [VehicleVisible] = plate == "" ? try service.fetchData():try service.fetchData(withPlate: plate.uppercased())
        presenter?.refreshData(with: vehicles)
    }
}
