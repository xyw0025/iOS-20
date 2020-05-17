//
//  Calculator.swift
//  105350023-Calculator
//
//  Created by Wen Hsin-Yu on 2020/5/2.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//
//
//import Foundation
//class Calculator {
//    var counter = 0
//    var computingResultString = ""
//    var result = 0.0
//    var padString = [String]()
//    var operand1 = ""
//    var operand2 = ""
//    var operator1 = ""
//    var dotFlag = false
//    func printPad() {
//        print(padString)
//    }
//    func split() {
//        for i in counter...padString.count-1 {
//            if dotFlag == true, padString[i] == "." {continue}
////            if padString[0] == "." {operand1 += "0"}
//            switch padString[i] {
//            case "+", "-", "x", "÷", "±":
//                operator1 = padString[i]
//                if operand1 == "", padString[i] != "±" {
//                    operand1 = "0"
//                }
//                dotFlag = false
//
//            default:
//                if padString[i] == "." {
//                    dotFlag = true
//                }
//                if operator1 != "", operator1 != "±" {
//                    operand2 += padString[i]
//                }
//                else if computingResultString == "" {
//                    operand1 += padString[i]
//                }
//            }
//        }
//        
//        computingResultString = operand1 + " " + operator1 + " " + operand2
//        counter = padString.count
//    }
//
//
//
//    
//    func calculate()-> Double {
//        if operand1 != "" {
//            switch operator1 {
//                case "+":
//                    if operand2 != "" {
//                        result = Double(operand1)! + Double(operand2)!
//                    }
//
//                case "-":
//                    if operand2 != "" {
//                        result = Double(operand1)! - Double(operand2)!
//                    }
//
//                case "x":
//                    if operand2 != "" {
//                        result = Double(operand1)! * Double(operand2)!
//                    }
//                case "÷":
//                    if operand2 != "" {
//                        if operand2 == "0" {
//                            return 0
//                        }
//                        result = Double(operand1)! / Double(operand2)!
//                    }
//                case "±":
//                    result = -Double(operand1)!
//                case "":
//                    result = Double(operand1)!
//                default:
//                    result = 0
//            }
//
//
//        }
//        operand1 = String(result)
//        operand2 = ""
//        computingResultString += " = "
//        return result
//    }
//}
