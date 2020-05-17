//
//  ViewController.swift
//  CardGame
//
//  Created by Wen Hsin-Yu on 2020/3/25.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in cardButtons {
            button.layer.cornerRadius = 10
        }
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        resultLabel.textAlignment = .center
        setNewGameButton()
        updateViewFromModel()

    }

    lazy var game = MatchingCard(numberOfCards: cardButtons.count)
    var win = 0
    var lose = 0

    var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: "flip coounts: \(flipCount), win: \(win) , lose: \(lose)", attributes: attributes)
        resultLabel.attributedText = attributedString
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    @IBAction func newGameButton(_ sender: UIButton) {
        newGame()
    }
    func setNewGameButton() {
        newGameButton.layer.cornerRadius = 5
        newGameButton.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    func newGame() {
        game = MatchingCard(numberOfCards: cardButtons.count)
        numChoices = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
        win = 0
        lose = 0
        flipCount = 0
        updateViewFromModel()
    }

    var numChoices = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
    var num = [Card: String]()
    func num(for card: Card) -> String {
        if numChoices.count > 0, num[card] == nil {
            let randomIndex = numChoices.count.arc4random
            num[card] = numChoices.remove(at: randomIndex)
//            print("randomIndex \(randomIndex), num: \(num[card]!)")

        }
        return num[card] ?? "?"
    }
    func compareCards(with currentIndex: Int) {
        let firstNum = Int(cardButtons[game.firstCardIndex].currentTitle ?? "0") ?? 0
        let currentNum = Int(cardButtons[currentIndex].currentTitle ?? "0") ?? 0
        if currentNum > firstNum || currentNum == 1 {
            win += 1
        }
        else {
            lose += 1
        }
        //            print("index: \(currentIndex), num:\(currentNum), firstnum:s \(firstNum)")

    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let currentIndex = cardButtons.firstIndex(of: sender) , currentIndex != game.firstCardIndex, !game.cards[currentIndex].isFlip {
//            print("touhcIndex: \(touchIndex), randomIndex: \(game.firstCardIndex)")
            game.chooseCard(at: currentIndex)
            updateViewFromModel()
            compareCards(with: currentIndex)
            flipCount += 1
        }
    }

    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFirst {
                button.setTitle(num(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 0.3070419521)
            }
            else if card.isFaceUp {
                button.setTitle(num(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4571650257)
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
    }

}
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
