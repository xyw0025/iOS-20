//
//  CalculatorBrain.swift
//  SwiftUICalculator
//
//  Created by Wen Hsin-Yu on 2020/5/9.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp(
        left: String,
        op: CalculatorButtonItem.Op )
    case leftOpRight(
        left: String,
        op: CalculatorButtonItem.Op,
        right: String
    )
    case error

    var output: String {
        let result: String
        switch self {
        case .left(let left):
            result = left
        case .leftOp(let left, _): result = left
        case .leftOpRight(_, _, let right): result = right
        case . error: return "Error"
        }
        guard let value = Double(result) else {
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .dot:
            return applyDot()
        case .digit(let num) {
            apply(num: num)
            }
        case .command(let command) {
            apply(command: command)
            }
        case .op(let op) {
            apply(op: op)
            }
        }
    }

    func apply(num: Int) -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .left(left.apply(num: num))
        case .leftOp(let left, let op):
            return .leftOpRight(left: left, op: op, right: "0".apply(num: num))
        case .leftOpRight(let left, let op, let right) {
//            return .leftOpRight(left: l)
            }
        }
    }
    func applyDot() -> CalculatorBrain {

    }
    func apply(command: String) -> CalculatorBrain {

    }
}

var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 8
    f.numberStyle = .decimal
    return f
}()

extension String {

    func apply(num: Int) -> String {
        return self == "0"? "\(num)" : "\(self)\(num)"
    }
}
