//
//  ParkingShiftPayment.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class ParkingShiftPaymentTest: XCTestCase {

    func test_calculateParkingShiftPriceAl27H_calculateParkingValue_success() {
        // Arrange
        guard let car = try? Car(plate: "DSA123")
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 27),
                                      vehicle: car)
        else { return XCTAssertTrue(false) }
        let payment = ParkingShiftPayment(parkingShift: shift, priceDay: 8000, priceHour: 1000)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 11000)
    }

    func test_calculateParkingShiftPriceAt10H_calculateParkingValue_success() {
        // Arrange
        guard let car = try? Car(plate: "DSA123")
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 10),
                                      vehicle: car)
        else { return XCTAssertTrue(false) }
        let payment = ParkingShiftPayment(parkingShift: shift, priceDay: 8000, priceHour: 1000)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 8000)
    }
}
