//
//  PresentationUITestsLaunchTests.swift
//  PresentationUITests
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import XCTest

class PresentationUITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        sleep(1)
    }

    func testLaunch() throws {
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
