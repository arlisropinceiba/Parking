//
//  HomeTest.swift
//  PresentationUITests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 22/02/22.
//

import XCTest
import Presentation

class HomeTest: XCTestCase, Screen {
    
    let app: XCUIApplication = XCUIApplication()
    var plate = ""
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        sleep(1)
    }
    
    func test_tappingAddVehiclesButton_addVehicle_success() {
        // Arrange
        app.buttons["+"].tap()
        let plate = randomString(length: 3) + randomNumber(length: 3)
        let plateTextFields = app/*@START_MENU_TOKEN@*/.textFields["PlateTextField"]/*[[".textFields[\"ABC123\"]",".textFields[\"PlateTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        plateTextFields.tap()
        plateTextFields.typeText(plate)
        // Act
        app.buttons["Agregar"].tap()
        // Assert
        XCTAssertTrue(app.collectionViews.staticTexts[plate].exists)
    }
    
    func test_tappingPlateInFinder_searchForPlate_success(){
        // Arrange
        let letter = randomString(length: 1)
        let finder = app/*@START_MENU_TOKEN@*/.textFields["PlateFinder"]/*[[".textFields[\"ABC123\"]",".textFields[\"PlateFinder\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        finder.tap()
        
        finder.typeText(letter)
        // Act
        app.buttons["Search"].tap()
        // Assert
        XCTAssertTrue(app.collectionViews.containing(NSPredicate(format: "label CONTAINS %@", letter)).count >= 0)
    }
    
    func test_tappingPlateInFinder_showAllParkingShiftsWhenFinderIsEmpty_success(){
        // Arrange
        let finder = app/*@START_MENU_TOKEN@*/.textFields["PlateFinder"]/*[[".textFields[\"ABC123\"]",".textFields[\"PlateFinder\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        finder.tap()
        let cellsCount = app.collectionViews.cells.count
        // Act
        app.buttons["Search"].tap()
        // Assert
        XCTAssertTrue(app.collectionViews.cells.count == cellsCount)
    }
    
    func test_tappingFinishParkingShiftButton_finishService_success() {
        // Arrange
        let cell = app.collectionViews.staticTexts["0H"]
        cell.tap()
        // Act
        app/*@START_MENU_TOKEN@*/.staticTexts["Finalizar turno"]/*[[".buttons[\"Finalizar turno\"].staticTexts[\"Finalizar turno\"]",".staticTexts[\"Finalizar turno\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Aceptar"]/*[[".buttons[\"Aceptar\"].staticTexts[\"Aceptar\"]",".staticTexts[\"Aceptar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        // Assert
        XCTAssertTrue(!app.collectionViews.staticTexts[plate].exists)
    }
    
    func test_tappingFinishParkingShiftButton_showValue_success() {
        // Arrange
        app.buttons["+"].tap()
        let plate = randomString(length: 3) + randomNumber(length: 3)
        let plateTextFields = app/*@START_MENU_TOKEN@*/.textFields["PlateTextField"]/*[[".textFields[\"ABC123\"]",".textFields[\"PlateTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        plateTextFields.tap()
        plateTextFields.typeText(plate)
        app.buttons["Agregar"].tap()
        let cell = app.collectionViews.staticTexts["0H"]
        cell.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Finalizar turno"]/*[[".buttons[\"Finalizar turno\"].staticTexts[\"Finalizar turno\"]",".staticTexts[\"Finalizar turno\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        // Act
        let valueLabel = app.staticTexts["0"]
        // Assert
        XCTAssertTrue(valueLabel.label.count == 1 )
    }

    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func randomNumber(length: Int) -> String {
      let letters = "0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
