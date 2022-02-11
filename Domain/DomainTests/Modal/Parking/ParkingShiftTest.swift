//
//  ParkingShiftTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class ParkingShiftTest: XCTestCase {

    func test_getAdmissionDate_verifyExistenceAdmmisionDate_success() {
        //Arrange
        let plate = "CDE234"
        let expectedDate = Date().localDate
        let car = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: expectedDate, vehicle: car)
        //Act
        let date = shift.getAdmissionDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDateWhenItsNil_error() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: Date().localDate, vehicle: car)
        //Act
        //Assert
        XCTAssertThrowsError(try shift.getDepartureDate())
    }
    
    func test_getDepartureDate_verifyDepartureDateGreaterThanAdmissionDate_success() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: Date().localDate, vehicle: car)
        let date = Date().localDate.advanceDate(thisHours: 1)
        //Act
        //Assert
        XCTAssertNoThrow(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyDepartureDateLowerThanAdmissionDate_error() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: Date().localDate, vehicle: car)
        let date = Date().localDate.lateDate(thisHours: 1)
        //Assert
        XCTAssertThrowsError(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDate_success() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: Date().localDate, vehicle: car)
        let expectedDate = Date().localDate.advanceDate(thisHours: 1)
        try! shift.setDepartureDate(expectedDate)
        //Act
        let date = try! shift.getDepartureDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }
    
    func test_getDepartureDate_verifyExistenceVehicle_error() {
        //Arrange
        let plate = "CDE234"
        let expectedVehicle: Vehicle = try! Car(plate: plate)
        let shift = try! ParkingShift(admissionDate: Date().localDate, vehicle: expectedVehicle)
        //Act
        let vehicle = shift.getVehicle()
        //Assert
        XCTAssertTrue(vehicle.getPlate() == expectedVehicle.getPlate())
    }
    
    func test_init_plateBeginningWithAOnAMonday_success() {
        //Arrange
        let plate = "ADE234"
        let car: Car = try! Car(plate: plate)
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Monday)
        //Act
        //Assert
        XCTAssertNoThrow(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }
    
    func test_init_plateBeginningWithAOnASunday_success() {
        //Arrange
        let plate = "ADE234"
        let car: Car = try! Car(plate: plate)
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Sunday)
        //Act
        //Assert
        XCTAssertNoThrow(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }
    
    func test_init_plateBeginningWithAOnAWednesday_error() {
        //Arrange
        let plate = "ADE234"
        let car: Car = try! Car(plate: plate)
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Wednesday)
        //Act
        //Assert
        XCTAssertThrowsError(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }
}
