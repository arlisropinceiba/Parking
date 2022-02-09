//
//  CarParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class CarParkingCoreDataRepository: ParkingCoreDataRepository, CarParkingShiftRepository {
 
    public static let shared = CarParkingCoreDataRepository()
    
    init(){
        super.init(translator: CarParkingShiftTranslator())
    }
    
    public func getCountOfCars () throws -> Int {
        let parkingsSaved = try getFetchActiveParkingShift()
        let carParkingsSaved = parkingsSaved.filter({$0.vehicle is CarCoreEntity})
        return carParkingsSaved.count
    }
}
