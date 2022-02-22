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
    var translator: VehicleVisibleTranslator?
    var service: ParkingShiftService?
    
    func createParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws {
        let localAccess = LocalService(type: type)
        guard let parkingShift: ParkingShift = try localAccess.getTranslator().fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await service?.saveThis(shift: parkingShift)
        try fetchData(withThisType: type)
    }
    
    func finishParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible {
        vehicle.setDepartureDate(Date())
        let localAccess = LocalService(type: type)
        guard let parkingShiftPayment: ParkingShiftPayment = try localAccess.getTranslator().fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}
        
        try await localAccess.getService().finishParkingShift(shift: parkingShiftPayment)
        
        guard let vehicleVisible: VehicleVisible = try translator?.fromDomainToVisibleEntity(parkingShiftPayment) else {
            return vehicle}
        try fetchData(withThisType: type)
        return vehicleVisible
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        let localAccess = LocalService(type: type)
        let parkingShifts = (plate == "" ? try localAccess.getService().getParkingShift() : try localAccess.getService().searchParkingShift(withPlate: plate.uppercased()))
        let vehicles: [VehicleVisible] = try localAccess.getTranslator().fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
    
    func fetchData(withThisType type: VehicleType) throws  {
        let localAccess = LocalService(type: type)
        let parkingShifts = try localAccess.getService().getParkingShift()
        let vehicles: [VehicleVisible] = try localAccess.getTranslator().fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
}
