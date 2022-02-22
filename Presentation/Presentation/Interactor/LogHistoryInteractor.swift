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
        
    func fetchData(withThisType type: VehicleType) throws {
        let localAccess = LocalService(type: type)
        let parkingShifts = try  localAccess.getService().getFinalizedParkingShifts()
        let vehicles: [VehicleVisible] = try localAccess.getTranslator().fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        let localAccess = LocalService(type: type)
        let parkingShifts = (plate == "" ? try localAccess.getService().getFinalizedParkingShifts() : try localAccess.getService().searchFinalizedParkingShift(withPlate: plate.uppercased()))
        let vehicles: [VehicleVisible] = try localAccess.getTranslator().fromDomainToVisibleEntity(parkingShifts)
        presenter?.refreshData(with: vehicles)
    }
}

