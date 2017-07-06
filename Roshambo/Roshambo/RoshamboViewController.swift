//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by 김성준 on 2017. 7. 6..
//  Copyright © 2017년 김성준. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Programmatic Approach
    
    @IBAction func clickRock(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
    }

    // MARK: Segue with Code Approach
    
    @IBAction func clickPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    // MARK: Utilities
    
    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }
}

