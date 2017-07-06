//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by 김성준 on 2017. 7. 6..
//  Copyright © 2017년 김성준. All rights reserved.
//

import UIKit

// MARK: - Shape: String

// The enum "Shape" represents a play or move
enum Shape: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}


class ResultsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    // MARK: Properties
    
    var userChoice: Shape!
    var opponentChoice: Shape = Shape.randomShape()
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // MARK: UI
    
    // The displayResult method generates the image and message for the results of a match.
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    // MARK: Actions
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
