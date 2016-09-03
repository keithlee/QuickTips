//
//  TipViewController.swift
//  QuickTip
//
//  Created by Keith Lee on 9/1/16.
//  Copyright © 2016 Keith Lee. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tipSegmentedControl!.setTitle("\(self.userDefaults.doubleForKey(TipKeys.minimumTipKey)*100)%", forSegmentAtIndex: 0)
        self.tipSegmentedControl!.setTitle("\(self.userDefaults.doubleForKey(TipKeys.mediumTipKey)*100)%", forSegmentAtIndex: 1)
        self.tipSegmentedControl!.setTitle("\(self.userDefaults.doubleForKey(TipKeys.largeTipKey)*100)%", forSegmentAtIndex: 2)
        
        self.tipSegmentedControl!.selectedSegmentIndex = self.userDefaults.integerForKey(defaultTipKey)
        self.calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var billAmount: Double {
        get {
            return Double(self.billField.text!) ?? 0
        }
        set {
            self.billField.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    
    var total: Double {
        get {
            return Double(self.totalLabel.text!) ?? 0
        }
        set {
            self.totalLabel.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    
    var tipAmount: Double {
        get {
            return Double(self.tipLabel.text!) ?? 0
        }
        set {
            self.tipLabel.text = "$\(String(format: "%.2f", newValue))"
        }
    }
   
    @IBAction func calculateTip(sender: AnyObject) {
        var tipPercent: Double
        switch self.tipSegmentedControl.selectedSegmentIndex {
            case 0: tipPercent = self.userDefaults.doubleForKey(TipKeys.minimumTipKey)
            case 1: tipPercent = self.userDefaults.doubleForKey(TipKeys.mediumTipKey)
            case 2: tipPercent = self.userDefaults.doubleForKey(TipKeys.largeTipKey)
            default: tipPercent = self.userDefaults.doubleForKey(TipKeys.minimumTipKey)
        }
        
        self.tipAmount = billAmount * tipPercent
        self.total = (billAmount * tipPercent) + billAmount
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
        self.resignFirstResponder()
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
