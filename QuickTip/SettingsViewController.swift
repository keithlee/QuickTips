//
//  SettingsViewController.swift
//  QuickTip
//
//  Created by Keith Lee on 9/2/16.
//  Copyright © 2016 Keith Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var smallTipField: UITextField!
    @IBOutlet weak var mediumTipField: UITextField!
    @IBOutlet weak var largeTipField: UITextField!
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        smallTipValue = userDefaults.doubleForKey(TipKeys.tipKey1) * 100
        mediumTipValue = userDefaults.doubleForKey(TipKeys.tipKey2) * 100
        largeTipValue = userDefaults.doubleForKey(TipKeys.tipKey3) * 100
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var smallTipValue: Double {
        get {
            return Double(smallTipField.text!) ?? 0
        }
        set {
            smallTipField.text = String(newValue)
        }
    }
    
    var mediumTipValue: Double {
        get {
            return Double(mediumTipField.text!) ?? 0
        }
        set {
            mediumTipField.text = String(newValue)
        }
    }

    var largeTipValue: Double {
        get {
            return Double(largeTipField.text!) ?? 0
        }
        set {
            largeTipField.text = String(newValue)
        }
    }
    
    @IBAction func updateMinTip(sender: AnyObject) {
        userDefaults.setDouble(smallTipValue / 100, forKey: TipKeys.tipKey1)
        userDefaults.synchronize()
    }
    @IBAction func updateMediumTip(sender: AnyObject) {
        userDefaults.setDouble(mediumTipValue / 100, forKey: TipKeys.tipKey2)
        userDefaults.synchronize()
    }
    @IBAction func updateLargeTip(sender: AnyObject) {
        userDefaults.setDouble(largeTipValue / 100, forKey: TipKeys.tipKey3)
        userDefaults.synchronize()
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
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
