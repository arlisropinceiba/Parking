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
        let expectedDate = Date()
        let car = try! Car(plate: plate)
        let shift = ParkingShift(admissionDate: expectedDate, vehicle: car)
        //Act
        let date = shift.getAdmissionDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDateWhenItsNil_error() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = ParkingShift(admissionDate: Date(), vehicle: car)
        //Act
        //Assert
        XCTAssertThrowsError(try shift.getDepartureDate())
    }
    
    func test_getDepartureDate_verifyDepartureDateGreaterThanAdmissionDate_success() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = ParkingShift(admissionDate: Date(), vehicle: car)
        let date = advanceDateOneHour
        //Act
        //Assert
        XCTAssertNoThrow(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyDepartureDateLowerThanAdmissionDate_error() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = ParkingShift(admissionDate: Date(), vehicle: car)
        let date = lateDateOneHour
        //Assert
        XCTAssertThrowsError(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDate_success() {
        //Arrange
        let plate = "CDE234"
        let car = try! Car(plate: plate)
        let shift = ParkingShift(admissionDate: Date(), vehicle: car)
        let expectedDate = advanceDateOneHour
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
        let shift = ParkingShift(admissionDate: Date(), vehicle: expectedVehicle)
        //Act
        let vehicle = shift.getVehicle()
        //Assert
        XCTAssertTrue(vehicle.getPlate() == expectedVehicle.getPlate())
    }

    
    var advanceDateOneHour: Date {
        return Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    }
    
    var lateDateOneHour: Date {
        return Calendar.current.date(byAdding: .hour, value: -1, to: Date()) ?? Date()
    }

}
