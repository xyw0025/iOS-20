//
//  Calculator.swift
//
//  Created by Wen Hsin-Yu on 2020/5/4.
//  Copyright 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation
class Calculator {
    var leftValue = ""
    var rightValue = ""
    var result = 0.0
    var operation = ""
    var currentOperation = ""
    func operation(from number: String) -> Double? {
        if (leftValue != "") {
            rightValue = number
        } else {
            leftValue = number
        }
        print("left :\(leftValue), right: \(rightValue), operator: \(operation)")

        if leftValue != "" && operation != "" {
            return calculate()
        }
        if operation == "±" {
            currentOperation = operation
        }



        return nil
    }

    func calculate()-> Double? {
//        print("into the calculate part")
        if leftValue != "" {
            if currentOperation == "" || currentOperation == "%" {
                currentOperation = operation
            }
            if (rightValue != "") {
                print("leftValue: \(leftValue), rightValue: \(rightValue) ")
                switch currentOperation {
                case "+":
                    if rightValue != "" {
                        result = Double(leftValue)! + Double(rightValue)!
                    }
                case "-":
                    if rightValue != "" {
                        result = Double(leftValue)! - Double(rightValue)!
                    }

                case "x":
                    if rightValue != "" {
                        result = Double(leftValue)! * Double(rightValue)!
                    }
                case "÷":
                    if rightValue != "" {
                        if rightValue == "0" {
                            return 0
                        }
                        result = Double(leftValue)! / Double(rightValue)!
                    }
                default:
                    result = 0
                }
            }
            else {
                switch currentOperation {
                    case "±":
                        result = -Double(leftValue)!
                        print(-Double(leftValue)!)
                    case "":
                        result = Double(leftValue)!
                    case "%":
                        result = Double(leftValue)! / 100
                    default:
                        return nil
                    //                   連按兩個運算的時候才會只運用後面那個operator
                }
            }
        }
        leftValue = String(result)
        rightValue = ""
        currentOperation = operation
        result = round(pow(10, 9) * result) / pow(10, 9)
        return result
    }



}
