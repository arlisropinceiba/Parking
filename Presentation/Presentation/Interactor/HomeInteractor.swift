//
//  HomeInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import Infrastructure
import Domain
import Foundation
import Combine

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var currentType: VehicleTypeElements = CarElements()
    private var translator: VehicleVisibleTranslator
    private var service: ParkingShiftService
        
    init() {
        (translator, service) = currentType.getElements()
    }
        
    func loadVehicleType(_ type: VehicleTypeElements) {
        currentType = type
        (translator, service) = currentType.getElements()
    }
        
    func createParkingShift(withThisVehicle vehicle: VehicleVisible) async throws {
        guard let parkingShift: ParkingShift =
                try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}

        try await service.saveThis(shift: parkingShift)
        try fetchData()
    }

    func finishParkingShift(withThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible {
        vehicle.setDepartureDate(Date())
        guard let parkingShiftPayment: ParkingShiftPayment =
                try translator.fromVisibleToDomainEntity(vehicle) else {
            throw PresentationErrors.ErrorSavingParking()}

        try await service.finishParkingShift(shift: parkingShiftPayment)

        guard let vehicleVisible: VehicleVisible =
                try translator.fromDomainToVisibleEntity(parkingShiftPayment) else {
            return vehicle}
        try fetchData()
        return vehicleVisible
    }

    func fetchData(withThisPlate plate: String) throws {
        let parkingShifts = (plate == "" ?
                            try service.getParkingShift() :
                            try service.searchParkingShift(withPlate: plate.uppercased()))
        let vehicles: [VehicleVisible] = try translator.fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }

    func fetchData() throws {
        let parkingShifts = try service.getParkingShift()
        let vehicles: [VehicleVisible] = try translator.fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
}
