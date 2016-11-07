//
//  ViewController.swift
//  Target Hitter
//
//  Created by Aleksander Skjoelsvik on 11/3/16.
//  Copyright © 2016 Aleksander Skjoelsvik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!
	
	var currentValue = 0
	var targetValue = 0
	var score = 0
	var round = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		
		startNewRound()
	}
	
	func startNewRound() {
		round += 1
		
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
		
		updateLabels()
	}
	
	func updateLabels() {
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}

	@IBAction func showAlert() {
		let difference = abs(targetValue - currentValue)
		let points = 100 - difference
		score += points
		
		let message = "You scored \(points) points"
		
		let alert = UIAlertController(title: "Open Web",
		                              message: message,
		                              preferredStyle: UIAlertControllerStyle.alert)
		let action = UIAlertAction(title: "Ok",
		                           style: UIAlertActionStyle.default,
		                           handler: nil)
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
		
		startNewRound()
	}
	
	@IBAction func sliderMoved(slider: UISlider) {
		currentValue = lroundf(slider.value)
	}
	
	@IBAction func startNewGame() {
		score = 0
		round = 0
		startNewRound()
	}
	
}
