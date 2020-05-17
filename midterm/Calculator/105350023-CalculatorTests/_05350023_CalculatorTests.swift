//
//  _05350023_CalculatorTests.swift
//  105350023-CalculatorTests
//
//  Created by Wen Hsin-Yu on 2020/4/23.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import XCTest
@testable import _05350023_Calculator

class _05350023_CalculatorTests: XCTestCase {
    func testMultiComputes(){
        XCTAssertEqual(compute(left: "10", right: "20", operation: "+"), 30)
        XCTAssertEqual(compute(left: "50", right: "9", operation: "-"), 41)
        XCTAssertEqual(compute(left: "3", right: "4", operation: "x"), 12)
        XCTAssertEqual(compute(left: "20", right: "5", operation: "÷"), 4)
    }

    func compute(left:String, right: String, operation: String)-> Double{
        let computation = Calculator()
        computation.leftValue = left
        computation.rightValue = right
        computation.operation = operation
        return computation.calculate()!
    }

}
