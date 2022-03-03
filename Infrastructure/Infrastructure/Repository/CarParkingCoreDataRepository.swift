//
//  CarParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Domain

public class CarParkingCoreDataRepository: ParkingCoreDataRepository, CarParkingShiftRepository {

    public static let shared = CarParkingCoreDataRepository()

    public init() {
        super.init(translator: CarParkingShiftTranslator())
    }

    public func getCountOfCars () throws -> Int {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let carParkingsSaved = parkingShiftsSaved.filter({$0.vehicle is CarCoreEntity})
        return carParkingsSaved.count
    }
}
