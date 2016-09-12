//
//  SettingsViewController.swift
//  QuickTip
//
//  Created by Keith Lee on 9/2/16.
//  Copyright © 2016 Keith Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipValue1 = userDefaults.doubleForKey(TipKeys.tipKey1) * 100
        tipValue2 = userDefaults.doubleForKey(TipKeys.tipKey2) * 100
        tipValue3 = userDefaults.doubleForKey(TipKeys.tipKey3) * 100
        themeControl.selectedSegmentIndex = userDefaults.objectForKey(themeKey) as! String == Theme.cool ? 0 : 1
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var tipValue1: Double {
        get {
            return Double(tip1Field.text!) ?? 0
        }
        set {
            tip1Field.text = String(Int(newValue))
        }
    }
    
    var tipValue2: Double {
        get {
            return Double(tip2Field.text!) ?? 0
        }
        set {
            tip2Field.text = String(Int(newValue))
        }
    }

    var tipValue3: Double {
        get {
            return Double(tip3Field.text!) ?? 0
        }
        set {
            tip3Field.text = String(Int(newValue))
        }
    }
    
    @IBAction func updateTip1(sender: AnyObject) {
        userDefaults.setDouble(tipValue1 / 100, forKey: TipKeys.tipKey1)
    }
    @IBAction func updateTip2(sender: AnyObject) {
        userDefaults.setDouble(tipValue2 / 100, forKey: TipKeys.tipKey2)
    }
    @IBAction func updateTip3(sender: AnyObject) {
        userDefaults.setDouble(tipValue3 / 100, forKey: TipKeys.tipKey3)
    }
    @IBAction func changeTheme(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            userDefaults.setObject(Theme.cool, forKey: themeKey)
        } else {
            userDefaults.setObject(Theme.warm, forKey: themeKey)
        }
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
