//
//  CarParkingDataBaseRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Domain

public class CarParkingDataBaseRepository: ParkingDataBaseRepository, CarParkingShiftRepository {

    public static let shared = CarParkingDataBaseRepository()

    public init() {
        super.init(translator: CarParkingShiftTranslator())
    }

    public func getCountOfCars() throws -> Int {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let carParkingsSaved = parkingShiftsSaved.filter({$0.type == VehicleType.car.rawValue})
        return carParkingsSaved.count
    }
}
