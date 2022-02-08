//
//  ParkingShiftRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public protocol ParkingShiftRepository{
    
    func saveParkingShift(shift: ParkingShift)
    func getParkingShift() -> [ParkingShift]
    func getCountOfVehicles () -> Int
    func finishParkingShift(shift: ParkingShift)
    func searchVehicle(withPlate plate: String) -> [ParkingShift]
    func isThereAVehicleWithActiveParkingShift() -> Bool
    
}
