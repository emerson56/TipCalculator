//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Emerson on 9/24/16.
//  Copyright © 2016 Emerson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefaultPercentage: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("view did load")
    
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "tip_default_percentage")
        tipDefaultPercentage.selectedSegmentIndex = index
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onDefaultPercentageChanged(_ sender: AnyObject) {
        //Change value of User Default based on the key
        let defaults = UserDefaults.standard
        let index = tipDefaultPercentage.selectedSegmentIndex
        //Save the index
        defaults.set(index, forKey: "tip_default_percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }


}
