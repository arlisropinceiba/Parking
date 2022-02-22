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
    var translator: VehicleVisibleTranslator?
    var service: ParkingShiftService?
    
    func setService(withThisType type: VehicleType){
        switch type {
        case .car:
            translator = CarVisibleTranslator()
            service = CarParkingShiftService(carParkingShiftRepository: CarParkingCoreDataRepository.shared)
        case .motorcycle:
            translator = MotorcycleVisibleTranslator()
            service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository: MotorcycleParkingCoreDataRepository.shared)
        }
    }
    
    func fetchData(withThisType type: VehicleType) throws {
        setService(withThisType: type)
        let parkingShifts = try service?.getFinalizedParkingShifts() ?? []
        let vehicles: [VehicleVisible] = try translator?.fromDomainToVisibleEntity(parkingShifts) ?? []
        presenter?.refreshData(with: vehicles)
    }
    
    func fetchData(withThisType type: VehicleType, andThisPlate plate: String) throws {
        setService(withThisType: type)
        let parkingShifts = (plate == "" ? try service?.getFinalizedParkingShifts() : try service?.searchFinalizedParkingShift(withPlate: plate.uppercased())) ?? []
        let vehicles: [VehicleVisible] = try translator?.fromDomainToVisibleEntity(parkingShifts) ?? []
        presenter?.refreshData(with: vehicles)
    }
}

