//
//  MotorcycleParkingShiftPaymentTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class MotorcycleParkingShiftPaymentTest: XCTestCase {

    func test_calculateParkingShiftPriceAl27HAndLowCapacity_calculateParkingValue_success(){
        // Arrange
        let motorcycle = try! Motorcycle(plate: "DSA123", cylinderCapacity: 200)
        let shift = ParkingShift(admissionDate: Date(), departureDate: Date().advanceDate(thisHours: 27), vehicle: motorcycle)
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 5500)
        
    }
    
    func test_calculateParkingShiftPriceAt10HAndLowCapacity_calculateParkingValue_success(){
        // Arrange
        let motorcycle = try! Motorcycle(plate: "DSA123", cylinderCapacity: 200)
        let shift = ParkingShift(admissionDate: Date(), departureDate: Date().advanceDate(thisHours: 10), vehicle: motorcycle)
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 4000)
        
    }
    
    func test_calculateParkingShiftPriceAl27HAndHighCapacity_calculateParkingValue_success(){
        // Arrange
        let motorcycle = try! Motorcycle(plate: "DSA123", cylinderCapacity: 650)
        let shift = ParkingShift(admissionDate: Date(), departureDate: Date().advanceDate(thisHours: 27), vehicle: motorcycle)
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 7500)
        
    }
    
    func test_calculateParkingShiftPriceAt10HAndHighCapacity_calculateParkingValue_success(){
        // Arrange
        let motorcycle = try! Motorcycle(plate: "DSA123", cylinderCapacity: 650)
        let shift = ParkingShift(admissionDate: Date(), departureDate: Date().advanceDate(thisHours: 10), vehicle: motorcycle)
        let payment = MotorcycleParkingShiftPayment(parkingShift: shift)
        // Act
        let value = try? payment.calculateParkingShiftPrice()
        //Assert
        XCTAssertTrue(value == 6000)
        
    }

}
