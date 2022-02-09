//
//  ParkingShiftRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public protocol ParkingShiftRepository{
    
    func saveParkingShift(shift: ParkingShift) throws
    func getParkingShift() throws -> [ParkingShift]
    func finishParkingShift(shift: ParkingShift) throws
    func searchVehicle(withPlate plate: String) throws -> [ParkingShift]
    func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool
    
}
