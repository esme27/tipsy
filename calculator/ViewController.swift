//
//  ViewController.swift
//  calculator
//
//  Created by Esme Romero on 12/8/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var viewBackground: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults();
    var counter = true;
    var total: Double!
    var currencyFormatter = NSNumberFormatter()
    let time = NSDate.timeIntervalSinceReferenceDate()
    
    
    func animatedBillField()
    {
        if (billField.text == "") {
<<<<<<< HEAD
            billField.placeholder = currencyFormatter.currencySymbol
            secondView.hidden = true
            userDefaults.setDouble(0.0, forKey: "Capture_total")
=======
            secondView.hidden = true
>>>>>>> 004f7187b59257e36ed4ab232508b775d5be8124
            UIView.animateWithDuration(1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                self.firstView.transform = CGAffineTransformMakeTranslation(0, 500);
                self.firstView.transform = CGAffineTransformMakeTranslation(0, 100);
                self.secondView.transform = CGAffineTransformMakeTranslation(0, 500);
                self.secondView.transform = CGAffineTransformMakeTranslation(0, 100);
                }, completion: nil)
            
        }
        
        
        if (billField.text != "") {
            secondView.hidden = false
            UIView.animateWithDuration(1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                self.firstView.transform = CGAffineTransformMakeTranslation(0, 0);
                self.firstView.transform = CGAffineTransformMakeTranslation(0, 0);
                self.secondView.transform = CGAffineTransformMakeTranslation(0, 0);
                self.secondView.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)    }
    }
    
    

    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        tipLabel.text = currencyFormatter.stringFromNumber(0.00)
        totalLabel.text = currencyFormatter.stringFromNumber(0.00)
        eachLabel.text = currencyFormatter.stringFromNumber(0.00)
        
        
        
        let tenMinuteValue = 10.0 * 60.0
        
<<<<<<< HEAD
        if ( ((time - userDefaults.doubleForKey("Capture_Time")) < tenMinuteValue ) && (userDefaults.doubleForKey("Capture_total") > 0.0) ) {
=======
        if ( ((time - userDefaults.doubleForKey("Capture_Time")) < tenMinuteValue ) && (userDefaults.floatForKey("Capture_Time") > 0.0) ) {
>>>>>>> 004f7187b59257e36ed4ab232508b775d5be8124
            billField.text = String(format: "%.2f", userDefaults.floatForKey("Capture_total"))
           
            
        
        }
        
<<<<<<< HEAD
        else {
           
            billField.text = ""
            billField.placeholder = currencyFormatter.currencySymbol
            
        }
        
=======
>>>>>>> 004f7187b59257e36ed4ab232508b775d5be8124
    }
    
        override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        //onTextChange(tipLabel)
<<<<<<< HEAD
       
=======
        onEditingChange(tipControl)
>>>>>>> 004f7187b59257e36ed4ab232508b775d5be8124
        
        UIView.animateWithDuration(6) { () -> Void in
            self.viewBackground.alpha = 0
            self.viewBackground.alpha = 1
        }
        
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
<<<<<<< HEAD
       
        onEditingChange(tipControl)
=======
        
>>>>>>> 004f7187b59257e36ed4ab232508b775d5be8124
        billField.becomeFirstResponder()
        
        animatedBillField()
            
            
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        
        
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22, Double(userDefaults.integerForKey("Tip_Default")) / 100.0]
        let tipPercentage = tipPercentages [tipControl.selectedSegmentIndex]
        
        
        let billAmount = (billField.text! as NSString).doubleValue
        
        let tip = billAmount *  tipPercentage
        total = billAmount + tip
       
        
        onTextChange(sender)
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        userDefaults.setDouble(NSDate.timeIntervalSinceReferenceDate(), forKey: "Capture_Time")
        
        userDefaults.setDouble(billAmount, forKey: "Capture_total")
        
        animatedBillField()
        
        }
    
    @IBAction func onTextChange(sender: AnyObject) {
    
      let split = (splitField.text! as NSString).doubleValue
        
        
     if ( split >= 1 ) {
            
       let each = total / split
        
        eachLabel.text = currencyFormatter.stringFromNumber(each)
        
        
    }
        
    else {
        
        eachLabel.text = currencyFormatter.stringFromNumber(0.00)
        
    }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
       
        view.endEditing(true)
    }
    
}