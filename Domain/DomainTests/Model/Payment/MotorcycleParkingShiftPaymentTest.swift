//
//  MotorcycleParkingShiftPaymentTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class MotorcycleParkingShiftPaymentTest: XCTestCase {

    func test_calculateParkingShiftPriceAl27HAndLowCapacity_calculateParkingValue_success() {
        // Arrange
        guard let motorcycle = try? Motorcycle(plate: "DSA123", cylinderCapacity: 200)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 27),
                                    vehicle: motorcycle)
        else { return XCTAssertTrue(false) }
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift )
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 5500)
        
    }

    func test_calculateParkingShiftPriceAt10HAndLowCapacity_calculateParkingValue_success() {
        // Arrange
        guard let motorcycle = try? Motorcycle(plate: "DSA123", cylinderCapacity: 200)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 10),
                                      vehicle: motorcycle)
        else { return XCTAssertTrue(false) }
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 4000)
        
    }

    func test_calculateParkingShiftPriceAt27HAndHighCapacity_calculateParkingValue_success() {
        // Arrange
        guard let motorcycle = try? Motorcycle(plate: "DSA123", cylinderCapacity: 650)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 27),
                                      vehicle: motorcycle)
        else { return XCTAssertTrue(false) }
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 7500)
        
    }

    func test_calculateParkingShiftPriceAt10HAndHighCapacity_calculateParkingValue_success() {
        // Arrange
        guard let motorcycle = try? Motorcycle(plate: "DSA123", cylinderCapacity: 650)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(uid: UUID(),
                                      admissionDate: Date().localDate,
                                      departureDate: Date().localDate.advanceDate(thisHours: 10),
                                      vehicle: motorcycle)
        else { return XCTAssertTrue(false) }
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 6000)
        
    }

}
