//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Umut Yerli on 12/29/15.
//  Copyright © 2015 Umut Yerli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	@IBOutlet weak var defaultSlider: UISlider!
	@IBOutlet weak var defaultTip: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// initializing default variables
		let defaults = NSUserDefaults.standardUserDefaults()
		let floatValue = defaults.floatForKey("tipSliderDefault")
		
		defaultSlider.value = floatValue
		defaultTip.text = "\(Int(defaultSlider.value * 100))%"
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func defaultActionSlider(sender: UISlider) {
		let tempIndex = defaultSlider.value
		defaultTip.text = "\(Int(tempIndex * 100))%"
		let defaults = NSUserDefaults.standardUserDefaults()
		defaults.setFloat(tempIndex, forKey: "tipSliderDefault")
		defaults.synchronize()
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
