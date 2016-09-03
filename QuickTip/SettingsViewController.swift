//
//  SettingsViewController.swift
//  QuickTip
//
//  Created by Keith Lee on 9/2/16.
//  Copyright © 2016 Keith Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var minimumTipField: UITextField!
    @IBOutlet weak var mediumTipField: UITextField!
    @IBOutlet weak var largeTipField: UITextField!
    @IBOutlet weak var defaultTipControls: UISegmentedControl!
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minimumTipValue = userDefaults.doubleForKey(TipKeys.minimumTipKey) * 100
        mediumTipValue = userDefaults.doubleForKey(TipKeys.mediumTipKey) * 100
        largeTipValue = userDefaults.doubleForKey(TipKeys.largeTipKey) * 100
        self.defaultTipControls.selectedSegmentIndex = userDefaults.integerForKey(defaultTipKey)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var minimumTipValue: Double {
        get {
            return Double(self.minimumTipField.text!) ?? 0
        }
        set {
            self.minimumTipField.text = String(newValue)
            self.defaultTipControls.setTitle("\(String(newValue))%", forSegmentAtIndex: 0)
        }
    }
    
    var mediumTipValue: Double {
        get {
            return Double(self.mediumTipField.text!) ?? 0
        }
        set {
            self.mediumTipField.text = String(newValue)
            self.defaultTipControls.setTitle("\(String(newValue))%", forSegmentAtIndex: 1)
        }
    }

    var largeTipValue: Double {
        get {
            return Double(self.largeTipField.text!) ?? 0
        }
        set {
            self.largeTipField.text = String(newValue)
            self.defaultTipControls.setTitle("\(String(newValue))%", forSegmentAtIndex: 2)
        }
    }
    
    @IBAction func updateMinTip(sender: AnyObject) {
        userDefaults.setDouble(self.minimumTipValue / 100, forKey: TipKeys.minimumTipKey)
        userDefaults.synchronize()
    }
    @IBAction func updateMediumTip(sender: AnyObject) {
        userDefaults.setDouble(self.mediumTipValue / 100, forKey: TipKeys.mediumTipKey)
        userDefaults.synchronize()
    }
    @IBAction func updateLargeTip(sender: AnyObject) {
        userDefaults.setDouble(self.largeTipValue / 100, forKey: TipKeys.largeTipKey)
        userDefaults.synchronize()
    }
    
    @IBAction func selectDefaultTip(sender: AnyObject) {
        userDefaults.setInteger(self.defaultTipControls.selectedSegmentIndex, forKey: defaultTipKey)
        userDefaults.synchronize()
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
