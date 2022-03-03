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
        guard let car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: expectedDate, vehicle: car)
        else { return XCTAssertTrue(false) }
        //Act
        let date = shift.getAdmissionDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }

    func test_getDepartureDate_verifyExistenceDepartureDateWhenItsNil_error() {
        //Arrange
        let plate = "CDE234"
        guard let car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: Date().localDate, vehicle: car)
        else { return XCTAssertTrue(false) }
        //Act
        //Assert
        XCTAssertThrowsError(try shift.getDepartureDate())
    }

    func test_getDepartureDate_verifyDepartureDateGreaterThanAdmissionDate_success() {
        //Arrange
        let plate = "CDE234"
        guard let car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: Date().localDate, vehicle: car)
        else { return XCTAssertTrue(false) }
        let date = Date().localDate.advanceDate(thisHours: 1)
        //Act
        //Assert
        XCTAssertNoThrow(try shift.setDepartureDate(date))
    }

    func test_getDepartureDate_verifyDepartureDateLowerThanAdmissionDate_error() {
        //Arrange
        let plate = "CDE234"
        guard let car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: Date().localDate, vehicle: car)
        else { return XCTAssertTrue(false) }
        let date = Date().localDate.lateDate(thisHours: 1)
        //Assert
        XCTAssertThrowsError(try shift.setDepartureDate(date))
    }

    func test_getDepartureDate_verifyExistenceDepartureDate_success() {
        //Arrange
        let plate = "CDE234"
        guard let car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: Date().localDate, vehicle: car)
        else { return XCTAssertTrue(false) }
        let expectedDate = Date().localDate.advanceDate(thisHours: 1)
        try? shift.setDepartureDate(expectedDate)
        //Act
        let date = try? shift.getDepartureDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }

    func test_getDepartureDate_verifyExistenceVehicle_error() {
        //Arrange
        let plate = "CDE234"
        guard let expectedVehicle: Vehicle = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        guard let shift = try? ParkingShift(admissionDate: Date().localDate, vehicle: expectedVehicle)
        else { return XCTAssertTrue(false) }
        //Act
        let vehicle = shift.getVehicle()
        //Assert
        XCTAssertTrue(vehicle.getPlate() == expectedVehicle.getPlate())
    }

    func test_init_plateBeginningWithAOnAMonday_success() {
        //Arrange
        let plate = "ADE234"
        guard let car: Car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Monday)
        //Act
        //Assert
        XCTAssertNoThrow(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }

    func test_init_plateBeginningWithAOnASunday_success() {
        //Arrange
        let plate = "ADE234"
        guard let car: Car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Sunday)
        //Act
        //Assert
        XCTAssertNoThrow(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }

    func test_init_plateBeginningWithAOnAWednesday_error() {
        //Arrange
        let plate = "ADE234"
        guard let car: Car = try? Car(plate: plate)
        else { return XCTAssertTrue(false) }
        let supposedDate = Date().localDate.advanceDate(toThisDay: .Wednesday)
        //Act
        //Assert
        XCTAssertThrowsError(try ParkingShift(admissionDate: supposedDate, vehicle: car))
    }
}
