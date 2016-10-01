//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Emerson on 9/23/16.
//  Copyright © 2016 Emerson. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load from settings
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tip_default_percentage")
        billField.becomeFirstResponder()

        
        /*NotificationCenter.default.addObserver(self, selector: #selector(applicationDidFinishLaunching), name: .UIApplicationDidFinishLaunching, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillTerminate), name: .UIApplicationWillTerminate, object: nil)
         */
    
    }
    func applicationDidFinishLaunching()
    {
        //Retrieve bill amount if within 10 mn
        //let defaults = UserDefaults.standard
        //let dateString = defaults.string(forKey: "last_accessed_date")
        //let lastBillAmount = defaults.integer(forKey: "last_bill_amount")
        
        /*if (dateString!.isEmpty)
        {
        let lastAccessedDate = DateFormatter().date(from: dateString!)

        let maxSeconds =  60*10.00
        
        if(Date().timeIntervalSince(lastAccessedDate!) <= maxSeconds)
        {
            billField.text =  String(format: "$ %.2f", lastBillAmount)
        }
        }*/
        
        
    }
    
    func applicationWillTerminate()
    {
        //Store bill amount
        let defaults = UserDefaults.standard
        let bill = billField.text ?? "0"
        defaults.set(bill, forKey: "last_bill_amount")
        defaults.set(NSDate(), forKey:"last_accessed_date")
        defaults.synchronize()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("tipview will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("tipview did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("tipview will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("tipview did disappear")
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        //view.endEditing(true)
        self.billField.alpha = 0
        let animations = {
            self.billField.alpha = 1
        }
        
        UIView.animate(withDuration: 1, animations: animations)

    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double (billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = currencyFormatter.string(for: tip)
        totalLabel.text = currencyFormatter.string(for: total)
        
    }
}

