//
//  MotorcycleParkingShiftPayment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public class MotorcycleParkingShiftPayment: ParkingShiftPayment {

    public init(parkingShift: ParkingShift) {
        super.init(parkingShift: parkingShift, priceDay: 4000, priceHour: 500)
    }

    public override func calculateParkingShiftPrice() throws -> Int {
        let extraChargeValueForHighCapacity = 2000
        let minimumCapacityToChargeExtra = 500
        var value = try super.calculateParkingShiftPrice()
        guard let motorcycle = (getParkingShift().getVehicle() as? Motorcycle) else {
            return 0
        }
        value += motorcycle.getCylinderCapacity() > minimumCapacityToChargeExtra ? extraChargeValueForHighCapacity:0
        return value
    }
}
