//
//  ViewController.swift
//  105350023-Calculator
//
//  Created by Wen Hsin-Yu on 2020/4/23.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        render()
    }

    var calculator = Calculator()
    func restartCalculator() {
        calculator = Calculator()
        result = 0.0
        dotFlag = false
        computeFlag = false
        runningComputing = ""
        render()
    }
    func render() {
        updateComputingLabel()
        updateResultLabel()
        updateButtons()
    }
    var computeFlag = false // 按過等號沒有
    var result = 0.0 {didSet {updateResultLabel()}}
    var runningNum = ""
    var runningComputing = "" {didSet {updateComputingLabel()}}
    @IBOutlet weak var resultLabel: UILabel!

    func updateButtons() {
        for button in padButtons {
            button.titleLabel?.font = .systemFont(ofSize: 30)


//            let attributes: [NSAttributedString.Key: Any] = [
//                    .strokeWidth : 5.0,
//                    .font: UIFont.systemFont(ofSize: 30)
//                ]
//
//            let attributedString = NSAttributedString(string: "\(button.titleLabel)", attributes: attributes)
//            button.titleLabel?.attributedText = attributedString
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(buttonPressed), for: . touchDown)
            button.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        }
    }
    @objc func buttonPressed(_ sender: UIButton) {
        sender.backgroundColor = .yellow
    }
    @objc func buttonReleased(_ sender: UIButton) {
        sender.backgroundColor = .white
    }
    func updateResultLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),
            .font: UIFont.systemFont(ofSize: 50)
        ]
        var resultString = String(result)
        if result.truncatingRemainder(dividingBy: 1.0) == 0 {
            resultString = String(Int(result))
        }
        let attributedString = NSAttributedString(string: "\(resultString)", attributes: attributes)
        resultLabel.attributedText = attributedString
    }
    @IBOutlet weak var computingLabel: UILabel!
    func updateComputingLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),
            .font: UIFont.systemFont(ofSize: 35)
        ]
        let attributedString = NSAttributedString(string: "\(runningComputing)", attributes: attributes)
        computingLabel.attributedText = attributedString
    }
    @IBOutlet var padButtons: [UIButton]!

    @IBAction func touchAC(_ sender: UIButton) {
        calculator = Calculator()
        runningNum = ""
        result = 0
        restartCalculator()
    }
    var dotFlag = false
    @IBAction func touchPad(_ sender: UIButton) {
        if (sender.currentTitle == ".") {
            if (dotFlag){
                return
                //                已經有 dot
            }
            dotFlag = true
        }
        runningNum += sender.currentTitle!
        if (computeFlag) {
//            上一次的計算完成了直接重新開始計算
            restartCalculator()
        }
    }
    func renderNumber(on number: String) -> String {
        var renderedNum = number
        if let temp = Double(number) {
            renderedNum = String(format: "%.9g", temp)
        }
        return renderedNum
    }
    @IBAction func touchOperator(_ sender: UIButton) {

        if (computeFlag) {
            runningComputing = ""
            runningComputing += renderNumber(on: String(result))
            computeFlag = false
        }
        runningComputing += renderNumber(on: runningNum)
        if let operatorName = sender.currentTitle {
            if runningComputing == "" && operatorName != "±" {
                runningComputing += "0"
                calculator.leftValue = "0"
            }
            if (runningComputing.suffix(1) > "9" || runningComputing.suffix(1) < "0"), runningComputing != "", runningComputing.suffix(1) != "%" {
                runningComputing.removeLast()
                //                連續兩個operator, 取後面那個operator用
            }

            if operatorName != "=" {
                calculator.operation = sender.currentTitle!
                runningComputing += operatorName
            }
            else {
                calculator.currentOperation = ""
                runningComputing += operatorName
                computeFlag = true
            }
            if let r = calculator.operation(from: runningNum) {
                result = r
            }
            else if (computeFlag) {
                result = Double(calculator.leftValue)!
            }


            // 5=5
            dotFlag = false
            //            已經要下一個operand了 所以dotFlag改掉
            runningNum = ""
        }
    }
}


