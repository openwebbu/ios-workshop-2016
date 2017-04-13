//
//  ViewController.swift
//  TargetHitter
//
//  Created by Sean on 4/11/17.
//  Copyright © 2017 Sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var rounds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound(){
        rounds += 1
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels(){
        goalLabel.text = "Goal: " + String(targetValue)
        scoreLabel.text = "Score: " + String(score)
        roundLabel.text = "Round: " + String(rounds)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You guessed: \(currentValue) " +
            "\n The target value was: \(targetValue)" +
            "\n You get \(points) points"
        
        let alert = UIAlertController(title: "Target Hitter", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil);
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func startNewGame() {
        score = 0
        rounds = 0
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

