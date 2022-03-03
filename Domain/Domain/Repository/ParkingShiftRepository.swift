//
//  ParkingShiftRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public protocol ParkingShiftRepository {

    func saveParkingShift(shift: ParkingShift) async throws
    func getParkingShift() throws -> [ParkingShift]
    func getFinalizedParkingShifts() throws -> [ParkingShiftPayment]
    func finishParkingShift(shift: ParkingShiftPayment) async throws
    func searchParkingShift(withPlate plate: String) throws -> [ParkingShift]
    func searchFinalizedParkingShift(withPlate plate: String) throws -> [ParkingShiftPayment]
    func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool
}
