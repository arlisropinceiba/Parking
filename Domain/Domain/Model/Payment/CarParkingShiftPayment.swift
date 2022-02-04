//
//  CarParkingShiftPayment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

class CarParkingShiftPayment: ParkingShiftPayment {
    
    init(parkingShift: ParkingShift){
        super.init(parkingShift: parkingShift, priceDay: 8000, priceHour: 1000)
    }
}
