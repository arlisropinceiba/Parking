//
//  ParkingShiftRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public protocol ParkingShiftRepository{
    
    func saveParkingShift(shift: ParkingShift) async throws
    func getParkingShift() throws -> [ParkingShift]
    func getFinalizedParkingShifts() throws -> [ParkingShift]
    func finishParkingShift(shift: ParkingShiftPayment) async throws
    func searchVehicle(withPlate plate: String) throws -> [ParkingShift]
    func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool
    
}
