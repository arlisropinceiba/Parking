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
    let carRepository = CarParkingCoreDataRepository()
    let motorcycleRepository = MotorcycleParkingCoreDataRepository()
    
    var parkingsProvisional: [ParkingShift] = []

    func createCarPakingShift(car: CarVisible) async throws {
        try await createParkingShift(vehicle: car, translator: CarVisibleTranslator(), service: CarParkingShiftService(carParkingShiftRepository: carRepository), withThisType: .car)
    }
    
    func createMotorcyclePakingShift(motorcycle: MotorcycleVisible) async throws {
        try await createParkingShift(vehicle: motorcycle, translator: MotorcycleVisibleTranslator(), service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository: motorcycleRepository), withThisType: .motorcycle)
    }
    
    func createParkingShift(vehicle: VehicleVisible, translator: VehicleVisibleTranslator, service: ParkingShiftService, withThisType type: VehicleType) async throws{
        
        guard let parkingShift: ParkingShift = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.saveThis(shift: parkingShift)
        parkingsProvisional.append(parkingShift)
        try loadData(withThisType: type)
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
        let service = CarParkingShiftService(carParkingShiftRepository: carRepository)
        let parkingShifts = try service.getParkingShift() // parkingsProvisional
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchMotorcyclesData() throws -> [VehicleVisible] {
        let translator = MotorcycleVisibleTranslator()
        let service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository: motorcycleRepository)
        let parkingShifts = try service.getParkingShift() // parkingsProvisional
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func finishShift(vehicle: VehicleVisible, withThisType type: VehicleType) {

    }
    
}
