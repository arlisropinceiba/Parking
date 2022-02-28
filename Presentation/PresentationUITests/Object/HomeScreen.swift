//
//  HomeScreen.swift
//  PresentationUITests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 22/02/22.
//

import XCTest
import Presentation

struct HomeScreen: Screen {
    
    let app: XCUIApplication
    
    func makeTap(inThisButton button: HomeElementsIdentifiers) -> Self {
        app.buttons[button.rawValue].tap()
        return self
    }
    
    func makeTapInCollectionCell(WithText text: String) -> Self {
        app.collectionViews.staticTexts[text].tap()
        return self
    }
    
    func type(inThisTextField element: HomeElementsIdentifiers, thatText text: String) -> Self {
        let textField = app.textFields[element.rawValue]
        textField.tap()
        textField.typeText(text)
        return self
    }
    
    func verifyTheExistenceInCollectionView(ofThisPlate plate: String) -> Bool {
        return app.collectionViews.staticTexts[plate].exists
    }
    
    func searchingPlate(withThisLetter letter: String) -> Bool {
        return app.collectionViews.containing(NSPredicate(format: "label CONTAINS %@", letter)).count >= 0
    }
    
    func finishShift(plate: String) -> Self{
        let cell = app.collectionViews.staticTexts[plate]
        cell.tap()
        app.staticTexts[HomeElementsIdentifiers.finishParkingShifButton.rawValue].tap()
        app.staticTexts[HomeElementsIdentifiers.confirmPaymentButton.rawValue].tap()
        return self
    }
}
