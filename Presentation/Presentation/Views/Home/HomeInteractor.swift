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
    
    func createParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws {
        let service = LocalService(type: type)
        try await service.createParkingShift(vehicle: vehicle)
        try fetchData(withThisType: type)
    }
    
    func finishParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible {
        vehicle.setDepartureDate(Date())
        let service = LocalService(type: type)
        let vehicleVisible = try await service.finishShift(vehicle: vehicle)
        try fetchData(withThisType: type)
        return vehicleVisible
    }
    
    func fetchData(withThisType type: VehicleType) throws {
        try fetchData(withThisType: type, andThisPlate: "")
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        let service = LocalService(type: type)
        let vehicles: [VehicleVisible] = plate == "" ? try service.fetchData():try service.fetchData(withPlate: plate.uppercased())
        presenter?.refreshData(with: vehicles)
    }
}
