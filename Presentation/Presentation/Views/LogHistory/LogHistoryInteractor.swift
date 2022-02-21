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
        try fetchData(withThisType: type, andThisPlate: "")
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        let service = LocalService(type: type)
        let vehicles: [VehicleVisible] = plate == "" ? try service.fetchLog():try service.fetchLog(withPlate: plate.uppercased())
        presenter?.refreshData(with: vehicles)
    }
}

