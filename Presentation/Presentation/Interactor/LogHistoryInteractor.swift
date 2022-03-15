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
    
    func fetchData(withThisType type: VehicleTypeElements) throws {
        loadVehicleType(type)
        let parkingShifts = try service.getFinalizedParkingShifts()
        let vehicles: [VehicleVisible] = try translator.fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }

    func fetchData(withThisType type: VehicleTypeElements, andThisPlate plate: String) throws {
        loadVehicleType(type)
        let parkingShifts = (plate == "" ?
                            try service.getFinalizedParkingShifts() :
                            try service.searchFinalizedParkingShift(withPlate: plate.uppercased()))
        let vehicles: [VehicleVisible] = try translator.fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
}
