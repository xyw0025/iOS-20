//
//  _05350023_CalculatorUITests.swift
//  105350023-CalculatorUITests
//
//  Created by Wen Hsin-Yu on 2020/4/23.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import XCTest

class when_number_button_is_touched: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

    }

    func test_should_update_label() {
        let app = XCUIApplication()
        app.launch()

        let numberButton = app.buttons["numberButton1"]
        numberButton.tap()
        let equalButton = app.buttons["equalButton"]
        equalButton.tap()

        let label = app.staticTexts["label"]
        XCTAssertEqual("1=", label.label)


    }

//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
