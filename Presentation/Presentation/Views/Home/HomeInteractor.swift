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
    let carRepository = CarParkingCoreDataRepository.shared
    let motorcycleRepository = MotorcycleParkingCoreDataRepository.shared
    
    var parkingsProvisional : [ParkingShift] = []

    func createCarParkingShift(car: CarVisible) async throws {
        try await createParkingShift(vehicle: car, translator: CarVisibleTranslator(), service: CarParkingShiftService(carParkingShiftRepository: carRepository), withThisType: .car)
    }
    
    func createMotorcycleParkingShift(motorcycle: MotorcycleVisible) async throws {
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
        var parkingShifts = try service.getParkingShift()
        parkingShifts = parkingsProvisional
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchMotorcyclesData() throws -> [VehicleVisible] {
        let translator = MotorcycleVisibleTranslator()
        let service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository: motorcycleRepository)
        var parkingShifts = try service.getParkingShift()
        parkingShifts = parkingsProvisional
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func finishCarParkingShift(car: CarVisible) async throws -> VehicleVisible {
        return try await finishShift(vehicle: car, translator: CarVisibleTranslator(), service: CarParkingShiftService(carParkingShiftRepository: carRepository), withThisType: .car)
    }
    
    func finishMotorcycleParkingShift(motorcycle: MotorcycleVisible) async throws -> VehicleVisible {
        return try await finishShift(vehicle: motorcycle, translator: MotorcycleVisibleTranslator(), service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository: motorcycleRepository), withThisType: .motorcycle)
    }
    
    func finishShift(vehicle: VehicleVisible, translator: VehicleVisibleTranslator, service: ParkingShiftService, withThisType type: VehicleType) async throws -> VehicleVisible {
        guard let parkingShiftPayment: ParkingShiftPayment = try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service.finishParkingShift(shift: parkingShiftPayment)
        try loadData(withThisType: type)
        
        guard let vehicleVisible: VehicleVisible = try translator.fromDomainToVisibleEntity(parkingShiftPayment) else {
            return vehicle}
        return vehicleVisible
    }
}