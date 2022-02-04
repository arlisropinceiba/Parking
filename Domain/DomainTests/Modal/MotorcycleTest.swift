//
//  MotorcycleTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class MotorcycleTest: XCTestCase {

    func test_init_correctPlate_success() {
        //Arrange
        let plate = "CDE234"
        //Act
        //Assert
        XCTAssertNoThrow(try Motorcycle(plate: plate, cylinderCapacity: 500))
    }
    
    func test_init_plateWithOnlyNumbers_error() {
        //Arrange
        let plate = "124234"
        //Act
        //Assert
        XCTAssertThrowsError(try Motorcycle(plate: plate, cylinderCapacity: 500))
    }
    
    func test_init_plateWithOnlyLetters_error() {
        //Arrange
        let plate = "CDEhjk"
        //Act
        //Assert
        XCTAssertThrowsError(try Motorcycle(plate: plate, cylinderCapacity: 500))
    }
    
    func test_init_longPlate_error() {
        //Arrange
        let plate = "CDEhjk4567890"
        //Act
        //Assert
        XCTAssertThrowsError(try Motorcycle(plate: plate, cylinderCapacity: 500))
    }
    
    func test_init_shortPlate_error() {
        //Arrange
        let plate = "Ce567"
        //Act
        //Assert
        XCTAssertThrowsError(try Motorcycle(plate: plate, cylinderCapacity: 500))
    }
    
    func test_getPlate_verifyCurrentPlate_success() {
        //Arrange
        let expectedPlate = "CDE567"
        let vehicle = try! Motorcycle(plate: expectedPlate, cylinderCapacity: 500)
        //Act
        let plate = vehicle.getPlate()
        //Assert
        XCTAssertTrue(plate == expectedPlate)
    }
    
    func test_getCylinderCapacity_verifyCurrentCylinderCapacity_success() {
        //Arrange
        let expectedCylinderCapacity = 500
        let vehicle = try! Motorcycle(plate: "CDE567", cylinderCapacity: expectedCylinderCapacity)
        //Act
        let cylinderCapacity = vehicle.getCylinderCapacity()
        //Assert
        XCTAssertTrue(cylinderCapacity == expectedCylinderCapacity)
    }

}
