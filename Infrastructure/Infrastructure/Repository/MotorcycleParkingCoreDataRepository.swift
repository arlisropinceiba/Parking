//
//  MotorcycleParkingDataBaseRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Domain

public class MotorcycleParkingDataBaseRepository: ParkingDataBaseRepository, MotorcycleParkingShiftRepository {

    public static let shared = MotorcycleParkingDataBaseRepository()

    public init() {
        super.init(translator: MotorcycleParkingShiftTranslator())
    }

    public func getCountOfMotorcycles() throws -> Int {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let motorcycleParkingsSaved = parkingShiftsSaved.filter({$0.type == VehicleType.motorcycle.rawValue})
        return motorcycleParkingsSaved.count
    }

}
