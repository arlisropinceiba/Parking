//
//  CarParkingShiftRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

public protocol CarParkingShiftRepository: ParkingShiftRepository {
    func getCountOfCars() throws -> Int
}
