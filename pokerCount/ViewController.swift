//
//  ViewController.swift
//  pokerCount
//
//  Created by Bubbly Boey on 13/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var runningCountLabel: UILabel!
    @IBOutlet var betAmountLabel: UILabel!
    @IBOutlet var hitStayLabel: UILabel!
    

    
    @IBOutlet var cardsNeutralButton: UIButton!
    @IBOutlet var cardsHighButton: UIButton!
    @IBOutlet var cardsLowButton: UIButton!
    @IBOutlet var newDeckButton: UIButton!
    
    var incognitoMode = false
    var runningCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResults()
    }
    
    @IBAction func dealHighTapped(_ sender: Any) {
        runningCount += 1
        updateResults()
    }
    
    @IBAction func dealNeutralTapped(_ sender: Any) {
        runningCount += 0
        updateResults()
    }
    
    @IBAction func dealLowTapped(_ sender: Any) {
        runningCount -= 1
        updateResults()
    }
    
    @IBAction func newDeckTapped(_ sender: Any) {
        runningCount = 0
        updateResults()
    }
    
    func updateResults() {
        runningCountLabel.text = runningCount >= 0 ? "+\(runningCount)" : "\(runningCount)"
        
        if incognitoMode {
            self.hitStayLabel.text = runningCount >= 0 ? "⨯" : "०"
        } else {
            self.hitStayLabel.text = runningCount >= 0 ? "HIT" : "STAY"
        }
        
        betAmountLabel.text = runningCount > 3 ? "↑" : "↓"
    }
    
   
    @IBAction func howToTapped(_ sender: Any) {
        showInfo()
    }
  
    
    func showInfo() {
        let info = """
        With Hi-Lo, the most common card counting system, the card values are as follows:\n
        2, 3, 4, 5, 6 = +1
        7, 8, 9 = 0
        10, J, Q, K, Ace = -1\n
        As each card is dealt, you will either add 1, subtract 1, or do nothing based on each card’s value.\n
        A card counter does this for each card that comes out of the shoe: card after card and round after round until the dealer shuffles the cards again.\n
        HINT: If you need to hide this app, you should swipe down to hide the UI. Then swipe up to show it again.
        """
        
        let alertController = UIAlertController(title: "Card-Counter Poker", message: info, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
        alertController.addAction(OKAction)
        alertController.view.tintColor = .black
        present(alertController, animated: true, completion: nil)
    }
    
}

