//
//  CarTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import XCTest
@testable import Domain

class CarTest: XCTestCase {
    
    func test_init_correctPlate_success() {
        //Arrange
        let plate = "CDE234"
        //Act
        //Assert
        XCTAssertNoThrow(try Car(plate: plate))
    }
    
    func test_init_plateWithOnlyNumbers_error() {
        //Arrange
        let plate = "124234"
        //Act
        //Assert
        XCTAssertThrowsError(try Car(plate: plate))
    }
    
    func test_init_plateWithOnlyLetters_error() {
        //Arrange
        let plate = "CDEhjk"
        //Act
        //Assert
        XCTAssertThrowsError(try Car(plate: plate))
    }
    
    func test_init_longPlate_error() {
        //Arrange
        let plate = "CDEhjk4567890"
        //Act
        //Assert
        XCTAssertThrowsError(try Car(plate: plate))
    }
    
    func test_init_shortPlate_error() {
        //Arrange
        let plate = "Ce567"
        //Act
        //Assert
        XCTAssertThrowsError(try Car(plate: plate))
    }
    
    func test_getPlate_verifyCurrentPlate_success() {
        //Arrange
        let expectedPlate = "CDE567"
        let vehicle = try! Car(plate: expectedPlate)
        //Act
        let plate = vehicle.getPlate()
        //Assert
        XCTAssertTrue(plate == expectedPlate)
    }
}
