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
        setNewGameButton()
        setTheme()

        updateViewFromModel()
    }

    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0 {
        didSet {
            updateScoreLabel()
        }
    }

    func updateScoreLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
                  .strokeWidth : 5.0,
                  .strokeColor : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
              ]
              let attributedString = NSAttributedString(string: "score: \(score)", attributes: attributes)
              scoreLabel.attributedText = attributedString
    }

    lazy var game = MatchingCard(numberOfCards: cardButtons.count)


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
//        numChoices = ["👨🏻‍🍳","👷🏻‍♂️","🌊","🍏","🍭","⛷","🧗🏻‍♂️","🧩","🎲"]
        score = 0
        setTheme()
        updateViewFromModel()
    }
    private var randomTheme: [String] = []
    private var animals: [String] = []
    private var sports: [String] = []
    private var flags: [String] = []
    private var foods: [String] = []
    private var theme: [[String]] = []
    private var emoji = [Int: String]()

    private var themeBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    private var themeButtonColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

    func setTheme() {
        animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"]
        sports = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒"]
        flags = ["🇹🇼", "🇯🇵", "🏳️", "🏴", "🏁", "🚩", "🏳️‍🌈", "🇱🇷", "🎌", "🇨🇦", "🇳🇵", "🇬🇪"]
        foods = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑"]
        theme = [animals, sports, flags, foods]
        let themeIndex = theme.count.arc4random
        randomTheme = theme[themeIndex]
        setColor(for: themeIndex)
    }
    func setColor(for themeIndex: Int) {
        switch themeIndex {
        case 0:
            themeBackgroundColor = #colorLiteral(red: 0.8121256828, green: 0.6782667041, blue: 0.6714325547, alpha: 1)
            themeButtonColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case 1:
            themeBackgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            themeButtonColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        case 2:
            themeBackgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            themeButtonColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 3:
            themeBackgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
            themeButtonColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        default:
            themeBackgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            themeButtonColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        }
    }

    func emoji(for card: Card) -> String {
        if randomTheme.count > 0, emoji[card.identifier] == nil {
            let randomIndex = randomTheme.index(randomTheme.startIndex, offsetBy: randomTheme.count.arc4random)
            emoji[card.identifier] = randomTheme.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }


    @IBAction func touchCard(_ sender: UIButton) {
        if let currentIndex = cardButtons.firstIndex(of: sender) , !game.cards[currentIndex].isFlip {
            game.chooseCard(at: currentIndex)
            updateViewFromModel()
        }
    }

    func updateViewFromModel() {
        score = game.score
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4571650257)
            } else {
                if !card.isMatched {
                    button.setTitle("", for: UIControl.State.normal)
                }
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3725117723) : themeButtonColor
            }
        }
        view.backgroundColor = themeBackgroundColor
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
