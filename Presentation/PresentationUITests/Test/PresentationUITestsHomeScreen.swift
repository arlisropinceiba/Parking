//
//  PresentationUITestsHomeScreen.swift
//  PresentationUITests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 27/02/22.
//

import XCTest

class PresentationUITestsHomeScreen: XCTestCase {

    let app = XCUIApplication()

    func test_HomeWindow_AddCarParkingShift_success() {
        // Given
        app.launch()
        //// A random plate
        let lettersNumberOnThePlate = 3
        let numbersNumberOnThePlate = 3
        let plate = randomString(
            withLength: lettersNumberOnThePlate) + randomNumber(withLength: numbersNumberOnThePlate)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .addVehicleButton)
            .type(inThisTextField: .plateTextField, thatText: plate)
            .makeTap(inThisButton: .confirmAddButton)
        // Then
        //// Verify the plate existance
        XCTAssertTrue(HomeScreen(app: app).verifyTheExistenceInCollectionView(ofThisPlate: plate))
        //// And finilized shift for quantity control
        _ = HomeScreen(app: app).finishShift(plate: plate)
    }

    func test_HomeWindow_AddMotorcycleParkingShift_success() {
        // Given
        app.launch()
        let lettersNumberOnThePlate = 3
        let numbersNumberOnThePlate = 3
        let cylinderCapacity = "\(Int.random(in: 51...1000))"
        let plate = randomString(
            withLength: lettersNumberOnThePlate) + randomNumber(withLength: numbersNumberOnThePlate)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .vehiclesListButton)
            .makeTap(inThisButton: .motorcycleItemList)
            .makeTap(inThisButton: .addVehicleButton)
            .type(inThisTextField: .plateTextField, thatText: plate)
            .type(inThisTextField: .cylinderCapacityTextField, thatText: cylinderCapacity)
            .makeTap(inThisButton: .confirmAddButton)
        // Then
        //// Verify the plate existance
        XCTAssertTrue(HomeScreen(app: app).verifyTheExistenceInCollectionView(ofThisPlate: plate))
        //// And finilized shift for quantity control
        _ = HomeScreen(app: app).finishShift(plate: plate)
    }

    func test_tappingPlateInFinder_searchForCarPlate_success() {
        // Given
        app.launch()
        let letter = randomString(withLength: 1)
        // When
        _ = HomeScreen(app: app)
            .type(inThisTextField: .plateFinderTextField, thatText: letter)
            .makeTap(inThisButton: .finderButton)
        // Then
        XCTAssertTrue(HomeScreen(app: app).searchingPlate(withThisLetter: letter))
    }

    func test_tappingPlateInFinder_searchForMotorcyclePlate_success() {
        // Given
        app.launch()
        let letter = randomString(withLength: 1)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .vehiclesListButton)
            .makeTap(inThisButton: .motorcycleItemList)
            .type(inThisTextField: .plateFinderTextField, thatText: letter)
            .makeTap(inThisButton: .finderButton)
        // Then
        XCTAssertTrue(HomeScreen(app: app).searchingPlate(withThisLetter: letter))
    }

    func test_tappingPlateInFinder_showAllParkingShiftsWhenFinderIsEmpty_success() {
        // Given
        app.launch()
        let cellsCount = app.collectionViews.cells.count
        // When
        _ = HomeScreen(app: app)
            .type(inThisTextField: .plateFinderTextField, thatText: "")
            .makeTap(inThisButton: .finderButton)
        // Then
        XCTAssertTrue(app.collectionViews.cells.count == cellsCount)
    }

    func test_tappingFinishCarParkingShiftButton_finishService_success() {
        // Given
        app.launch()
        let lettersNumberOnThePlate = 3
        let numbersNumberOnThePlate = 3
        let plate = randomString(
            withLength: lettersNumberOnThePlate) + randomNumber(withLength: numbersNumberOnThePlate)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .addVehicleButton)
            .type(inThisTextField: .plateTextField, thatText: plate)
            .makeTap(inThisButton: .confirmAddButton)
            .finishShift(plate: plate)
        // Then
        XCTAssertTrue(!HomeScreen(app: app).verifyTheExistenceInCollectionView(ofThisPlate: plate))
    }

    func test_tappingFinishMotorcycleParkingShiftButton_finishService_success() {
        // Given
        app.launch()
        let lettersNumberOnThePlate = 3
        let numbersNumberOnThePlate = 3
        let cylinderCapacity = "\(Int.random(in: 51...1000))"
        let plate = randomString(
            withLength: lettersNumberOnThePlate) + randomNumber(withLength: numbersNumberOnThePlate)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .vehiclesListButton)
            .makeTap(inThisButton: .motorcycleItemList)
            .makeTap(inThisButton: .addVehicleButton)
            .type(inThisTextField: .plateTextField, thatText: plate)
            .type(inThisTextField: .cylinderCapacityTextField, thatText: cylinderCapacity)
            .makeTap(inThisButton: .confirmAddButton)
            .finishShift(plate: plate)
        // Then
        XCTAssertTrue(!HomeScreen(app: app).verifyTheExistenceInCollectionView(ofThisPlate: plate))
    }

    func test_tappingFinishParkingShiftButton_showValue_success() {
        // Given
        app.launch()
        let lettersNumberOnThePlate = 3
        let numbersNumberOnThePlate = 3
        let plate = randomString(
            withLength: lettersNumberOnThePlate) + randomNumber(withLength: numbersNumberOnThePlate)
        // When
        _ = HomeScreen(app: app)
            .makeTap(inThisButton: .addVehicleButton)
            .type(inThisTextField: .plateTextField, thatText: plate)
            .makeTap(inThisButton: .confirmAddButton)
            .makeTapInCollectionCell(WithText: plate)
            .makeTap(inThisButton: .finishParkingShifButton)

        let valueLabel = app.staticTexts["0"]
        // Then
        XCTAssertTrue(valueLabel.label.count >= 1 )
    }

    // MARK: Functions

    func randomString(withLength length: Int) -> String {
        // sin la A para evitar error de ingreso de autos con placa Axxxxx el día lunes o domingo
      let letters = "BCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{_ in letters.randomElement()!})
    }

    func randomNumber(withLength length: Int) -> String {
        let letters = "0123456789"
        let arrayLength = (0..<length)
        let arrayChar = arrayLength.map{_ in
            letters.randomElement()!
        }
        return String(arrayChar)
    }
}
