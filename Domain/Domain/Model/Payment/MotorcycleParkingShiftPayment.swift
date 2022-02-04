//
//  MotorcycleParkingShiftPayment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

class MotorcycleParkingShiftPayment: ParkingShiftPayment {
    
    init(parkingShift: ParkingShift){
        super.init(parkingShift: parkingShift, priceDay: 4000, priceHour: 500)
    }
    
    override func calculateParkingShiftPrice() throws -> Int {
        let extraChargeValueForHighCylinderCapacity = 2000
        let minimumCylinderCapacityToChargeExtra = 500
        var value = try super.calculateParkingShiftPrice()
        guard let motorcycle = (parkingShift.getVehicle() as? Motorcycle) else {
            return 0
        }
        value += motorcycle.getCylinderCapacity() > minimumCylinderCapacityToChargeExtra ? extraChargeValueForHighCylinderCapacity:0
        return value
    }
}
