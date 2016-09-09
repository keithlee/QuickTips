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
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        tipAmount = userDefaults.doubleForKey(defaultTipKey)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var billAmount: Double {
//        get {
//            return Double(billField.text!) ?? 0
//        }
//        set {
//            billField.text = "$\(String(format: "%.2f", newValue))"
//        }
//    }
//    
//    var total: Double {
//        get {
//            return Double(totalLabel.text!) ?? 0
//        }
//        set {
//            totalLabel.text = "$\(String(format: "%.2f", newValue))"
//        }
//    }
//
//    var tipAmount: Double {
//        get {
//            return Double(tipLabel.text!) ?? 0
//        }
//        set {
//            tipLabel.text = "$\(String(format: "%.2f", newValue))"
//        }
//    }
   
    @IBAction func calculateTip(sender: AnyObject) {
//        let tipPercent: Double = 0
//        tipAmount = billAmount * tipPercent
//        total = (billAmount * tipPercent) + billAmount
        UIView.animateWithDuration(1.0) { [_self = self] in
            _self.mainView.backgroundColor = UIColor.init(red: 117/255, green: 255/255, blue: 232/255, alpha: 1)
        }
    }
    
    @IBAction func tipView1Pan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        var percent = Int((tipLabel1.text?.stringByReplacingOccurrencesOfString("%", withString: ""))!)!
        percent -= Int(translation.x / 2)
//        print(translation.y)
        print(translation.x)
        tipLabel1.text = "%\(percent)"
        
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer) {
        billField.resignFirstResponder()
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
