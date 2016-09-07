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
//        billField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(billField.becomeFirstResponder())
        print(billField.text)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        UIView.animateWithDuration(0.5) { [_self = self] in
//            _self.view.backgroundColor = UIColor.init(red: 117/255, green: 255/255, blue: 232/255, alpha: 1)
//        }
    }
    
    override func viewWillDisappear(animated: Bool) {
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
    
    var total: Double {
        get {
            return Double(totalLabel.text!) ?? 0
        }
        set {
            totalLabel.text = "$\(String(format: "%.2f", newValue))"
        }
    }
    
    var tipAmount: Double {
        get {
            return Double(tipLabel.text!) ?? 0
        }
        set {
            tipLabel.text = "$\(String(format: "%.2f", newValue))"
        }
    }
   
    @IBAction func calculateTip(sender: AnyObject) {
//        var tipPercent: Double = 0
//        tipAmount = billAmount * tipPercent
//        total = (billAmount * tipPercent) + billAmount
        UIView.animateWithDuration(1.0) { [_self = self] in
            _self.view.backgroundColor = UIColor.init(red: 117/255, green: 255/255, blue: 232/255, alpha: 1)
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
