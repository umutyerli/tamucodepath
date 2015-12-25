//
//  ViewController.swift
//  tipcalculator
//
//  Created by Umut Yerli on 12/20/15.
//  Copyright © 2015 Umut Yerli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tip_label: UILabel!
	@IBOutlet weak var bill_field: UITextField!
	@IBOutlet weak var total_label: UILabel!
	@IBOutlet weak var tip_control: UISegmentedControl!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		tip_label.text = "$0.00"
		total_label.text = "$0.00"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func on_editing_changed(sender: AnyObject) {
		let tip_percentages = [0.18, 0.2, 0.22]
		let tip_percentage = tip_percentages[tip_control.selectedSegmentIndex]
		
		
		let bill_amount = Double(NSString(string: bill_field.text!) as String)
		
		// default values
		if(bill_amount == nil) {
			tip_label.text = String("$0.00")
			total_label.text = String("$0.00")
		}
		
		// to prevent crashes
		if(bill_amount != nil) {
			let tip = bill_amount! * tip_percentage
			let total = bill_amount! + tip
		
			tip_label.text = String(format: "$%.2f", tip)
			total_label.text = String(format: "$%.2f", total)
		}
	}

	@IBAction func on_tap(sender: AnyObject) {
		view.endEditing(true)
	}
}

