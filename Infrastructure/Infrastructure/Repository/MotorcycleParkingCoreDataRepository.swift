//
//  MotorcycleParkingCoreDataRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Foundation
import Domain

public class MotorcycleParkingCoreDataRepository: ParkingCoreDataRepository, MotorcycleParkingShiftRepository {
    
    public static let shared = MotorcycleParkingCoreDataRepository()
    
    init(){
        super.init(translator: MotorcycleParkingShiftTranslator())
    }

    public func getCountOfMotorcycles () throws -> Int {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let motorcycleParkingsSaved = parkingShiftsSaved.filter({$0.vehicle is MotorcycleCoreEntity})
        return motorcycleParkingsSaved.count
    }

}
