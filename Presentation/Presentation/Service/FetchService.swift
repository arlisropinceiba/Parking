//
//  FetchService.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 21/02/22.
//

extension LocalService {
    
    func fetchData(withPlate plate: String) throws -> [VehicleVisible] {
        let parkingShifts = try service.searchParkingShift(withPlate: plate)
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchData() throws -> [VehicleVisible] {
        let parkingShifts = try service.getParkingShift()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchLog() throws -> [VehicleVisible] {
        let parkingShifts = try service.getFinalizedParkingShifts()
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
    func fetchLog(withPlate plate: String) throws -> [VehicleVisible] {
        let parkingShifts = try service.searchFinalizedParkingShift(withPlate: plate)
        return try translator.fromDomainToVisibleEntity(parkingShifts)
    }
    
}
