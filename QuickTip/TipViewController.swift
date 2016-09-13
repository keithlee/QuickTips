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
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tipView1: UIView!
    @IBOutlet weak var tipView2: UIView!
    @IBOutlet weak var tipView3: UIView!
    
    @IBOutlet weak var tipLabel1: UILabel!
    @IBOutlet weak var tipLabel2: UILabel!
    @IBOutlet weak var tipLabel3: UILabel!
    
    @IBOutlet weak var tipAmountLabel1: UILabel!
    @IBOutlet weak var tipAmountLabel2: UILabel!
    @IBOutlet weak var tipAmountLabel3: UILabel!
    
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    let billColor = UIColor.init(red: 255/255, green: 255/255, blue: 153/255, alpha: 0.2)
    
    let coolColorBlue = UIColor.init(red: 96/255, green: 239/255, blue: 248/255, alpha: 1)
    let coolColorGreen = UIColor.init(red: 24/255, green: 234/255, blue: 166/255, alpha: 1)
    let coolColorTurquoise = UIColor.init(red: 92/255, green: 251/255, blue: 231/255, alpha: 1)
    
    let warmColorYellow = UIColor.init(red: 255/255, green: 197/255, blue: 59/255, alpha: 0.8)
    let warmColorPink = UIColor.init(red: 218/255, green: 109/255, blue: 118/255, alpha: 1)
    let warmColorRed = UIColor.init(red: 229/255, green: 0/255, blue: 49/255, alpha: 0.8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let userdefaults = NSUserDefaults.standardUserDefaults()
        tipLabel1.text = "%\(Int(round(userdefaults.doubleForKey(TipKeys.tipKey1)*100)))"
        tipLabel2.text = "%\(Int(round(userdefaults.doubleForKey(TipKeys.tipKey2)*100)))"
        tipLabel3.text = "%\(Int(round(userdefaults.doubleForKey(TipKeys.tipKey3)*100)))"
        
        UIView.animateWithDuration(1.0) {
            if userdefaults.objectForKey(themeKey) as! String == Theme.warm {
                self.initWarm()
            } else {
                self.initCool()
            }
        }
        calculateTip(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var billAmount: Double {
        get {
            return Double(billField.text!) ?? 0
        }
        set {
            billField.text = "$\(String(format: "%.2f", newValue))"
        }
    }

    var total1: Double {
        get {
            return Double(totalLabel1.text!) ?? 0
        }
        set {
            totalLabel1.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    var total2: Double {
        get {
            return Double(totalLabel2.text!) ?? 0
        }
        set {
            totalLabel2.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    var total3: Double {
        get {
            return Double(totalLabel3.text!) ?? 0
        }
        set {
            totalLabel3.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    
    var tipAmount1: Double {
        get {
            return Double(tipLabel1.text!) ?? 0
        }
        set {
            tipAmountLabel1.text = "(\(String(format: "%.2f", newValue)))"
        }
    }
    var tipAmount2: Double {
        get {
            return Double(tipLabel2.text!) ?? 0
        }
        set {
            tipAmountLabel2.text = "(\(String(format: "%.2f", newValue)))"
        }
    }
    var tipAmount3: Double {
        get {
            return Double(tipLabel3.text!) ?? 0
        }
        set {
            tipAmountLabel3.text = "(\(String(format: "%.2f", newValue)))"
        }
    }
   
    @IBAction func calculateTip(sender: AnyObject) {
        if billField.text != "" && self.mainView.backgroundColor != billColor {
            UIView.animateWithDuration(1.0) { [weak self] in
                self?.mainView.backgroundColor = self?.billColor
            }
        }
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let tipPercent1 = userDefaults.doubleForKey(TipKeys.tipKey1)
        let tipPercent2 = userDefaults.doubleForKey(TipKeys.tipKey2)
        let tipPercent3 = userDefaults.doubleForKey(TipKeys.tipKey3)
        
        tipAmount1 = billAmount * tipPercent1
        tipAmount2 = billAmount * tipPercent2
        tipAmount3 = billAmount * tipPercent3
        total1 = (billAmount * tipPercent1) + billAmount
        total2 = (billAmount * tipPercent2) + billAmount
        total3 = (billAmount * tipPercent3) + billAmount
        
    }
    
    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer) {
        billField.resignFirstResponder()
    }
    
    func initWarm() {
        self.tipView1.backgroundColor = self.warmColorYellow
        self.tipView2.backgroundColor = self.warmColorPink
        self.tipView3.backgroundColor = self.warmColorRed
        for view in self.stackView.subviews {
            if view.isKindOfClass(UIView) {
                for sub in view.subviews {
                    if sub.isKindOfClass(UILabel) {
                        let label = sub as! UILabel
                        label.textColor = UIColor.blackColor()
                    }
                }
            }
        }
    }
    
    func initCool() {
        tipView1.backgroundColor = coolColorTurquoise
        tipView2.backgroundColor = coolColorBlue
        tipView3.backgroundColor = coolColorGreen
        for view in stackView.subviews {
            if view.isKindOfClass(UIView) {
                for sub in view.subviews {
                    if sub.isKindOfClass(UILabel) {
                        let label = sub as! UILabel
                        label.textColor = UIColor.whiteColor()
                    }
                }
            }
        }
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
