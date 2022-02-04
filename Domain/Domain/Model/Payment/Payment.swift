//
//  Payment.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

protocol PaymentCalculation {
    
    func calculateParkingShiftPrice(withPriceDay priceDay: Int, andPriceHour priceHour: Int, from addmissionDate: Date, to departureDate: Date)
    func calculateParkingShiftWithExtraPrice(withPriceDay priceDay: Int, andPriceHour priceHour: Int, from addmissionDate: Date, to departureDate: Date, cylinderCapacity: Int)
    
}
