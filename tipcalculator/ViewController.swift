//
//  ViewController.swift
//  tipcalculator
//
//  Created by Umut Yerli on 12/20/15.
//  Copyright © 2015 Umut Yerli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var billField: UITextField!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var dollarSign: UITextField!
	@IBOutlet weak var bottomView: UIView!
	@IBOutlet weak var tipPercent: UILabel!
	@IBOutlet weak var tipSlider: UISlider!
	
	let defaults = NSUserDefaults.standardUserDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// default values
		tipLabel.text = "$0.00"
		totalLabel.text = "$0.00"
		
		// the bill field is selected automatically
		billField.becomeFirstResponder()
		
		// unable to interact or edit dollar sign field
		dollarSign.userInteractionEnabled = false
		
		// makes the bottom view invisible by default
		bottomView.alpha = 0
		
		// values being intialized to default values
		tipSlider.value = defaults.floatForKey("tipSliderDefault")
		tipPercent.text = "\(Int(tipSlider.value * 100))%"
		
		// default locations for objects
		self.bottomView.center = CGPoint(x: self.bottomView.center.x, y: CGFloat(550))
		
		self.dollarSign.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
		dollarSign.textAlignment = NSTextAlignment.Center
		
		self.billField.center = CGPoint(x: self.view.center.x + 29, y: self.view.center.y)
		billField.textAlignment = NSTextAlignment.Center
	}
	
	var currentTipValue: Double? {
		return Double(tipSlider.value)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// function that checks bill field to see if it goes past max value
	func checkMaxLength(billField: UITextField!, maxLength: Int) {
			if (billField.text!.characters.count > maxLength) {
				billField.deleteBackward()
			}
		}
	
	@IBAction func on_editing_changed(sender: AnyObject) {
		
		// segment control that checks certain tip percentages
		// let tipPercentages = [0.18, 0.2, 0.22]
		// let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
		
		// function that checks bill field to see if it goes past max value
		checkMaxLength(sender as! UITextField, maxLength: 7)
	
		
		
		// turns billfield into a double value
		let billAmount = (billField.text! as NSString).doubleValue
		
		// decides tip and total cost
		let tip = billAmount * Double(currentTipValue!)
		let total = billAmount + tip
		
		
		// used for the dollar sign field under bill field
		dollarSign.text = "$\(billField.text!)"
		
		// format code
		tipLabel.text = String(format: "$%.2f", tip)
		totalLabel.text = String(format: "$%.2f", total)
		
		// animates the code
		if(billField.text != "") {
			
			// does the following if something is typed
			UIView.animateWithDuration(0.5, animations: {
				self.bottomView.alpha = 1
				self.tipLabel.alpha = 1
				self.bottomView.center = CGPoint(x: self.bottomView.center.x, y: CGFloat(385))
				self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(100))
				self.dollarSign.center = CGPoint(x: self.dollarSign.center.x, y: CGFloat(100))
			})
		} else {
			
			// does the following if something is not typed
			UIView.animateWithDuration(0.5, animations: {
				self.bottomView.alpha = 0
				self.bottomView.center = CGPoint(x: self.bottomView.center.x, y: CGFloat(550))
				self.dollarSign.center = CGPoint(x: self.dollarSign.center.x, y: CGFloat(180))
				self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
				
			})
		}
	}
	
	@IBAction func tipControl(sender: UISlider) {
		let tempInt = currentTipValue! * 100
		tipPercent.text = "\(Int(tempInt))%"
	}
	
	// used to remove decimal keyboard by touching main view
	@IBAction func on_tap(sender: AnyObject) {
		view.endEditing(true)
	}
}

