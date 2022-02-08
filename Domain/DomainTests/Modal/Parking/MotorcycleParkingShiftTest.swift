//
//  MotorcycleParkingShiftTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import XCTest
@testable import Domain

class MotorcycleParkingShiftTest: XCTestCase {

    func test_getAdmissionDate_verifyExistenceAdmmisionDate_success() {
        //Arrange
        let plate = "CDE234"
        let expectedDate = Date().localDate
        let motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: expectedDate, motorcycle: motorcycle)
        //Act
        let date = shift.getAdmissionDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDateWhenItsNil_error() {
        //Arrange
        let plate = "CDE234"
        let motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: motorcycle)
        //Act
        //Assert
        XCTAssertThrowsError(try shift.getDepartureDate())
    }
    
    func test_getDepartureDate_verifyDepartureDateGreaterThanAdmissionDate_success() {
        //Arrange
        let plate = "CDE234"
        let motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: motorcycle)
        let date = Date().localDate.advanceDate(thisHours: 1)
        //Act
        //Assert
        XCTAssertNoThrow(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyDepartureDateLowerThanAdmissionDate_error() {
        //Arrange
        let plate = "CDE234"
        let motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: motorcycle)
        let date = Date().localDate.lateDate(thisHours: 1)
        //Assert
        XCTAssertThrowsError(try shift.setDepartureDate(date))
    }
    
    func test_getDepartureDate_verifyExistenceDepartureDate_success() {
        //Arrange
        let plate = "CDE234"
        let motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: motorcycle)
        let expectedDate = Date().localDate.advanceDate(thisHours: 1)
        try! shift.setDepartureDate(expectedDate)
        //Act
        let date = try! shift.getDepartureDate()
        //Assert
        XCTAssertTrue(date == expectedDate)
    }
    
    func test_getDepartureDate_verifyExistencePlateVehicle_error() {
        //Arrange
        let plate = "CDE234"
        let expectedVehicle: Motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: expectedVehicle)
        //Act
        let vehicle = shift.getVehicle()
        //Assert
        XCTAssertTrue(vehicle.getPlate() == expectedVehicle.getPlate())
    }
    
    func test_getDepartureDate_verifyExistenceCylinderCapacityVehicle_error() {
        //Arrange
        let plate = "CDE234"
        let expectedVehicle: Motorcycle = try! Motorcycle(plate: plate, cylinderCapacity: 400)
        let shift = try! MotorcycleParkingShift(admissionDate: Date().localDate, motorcycle: expectedVehicle)
        //Act
        let cylinderCapacity = shift.getMotorcycle()?.getCylinderCapacity()
        //Assert
        XCTAssertTrue(cylinderCapacity == expectedVehicle.getCylinderCapacity())
    }

}
