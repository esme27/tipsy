//
//  SettingsViewController.swift
//  calculator
//
//  Created by Esme Romero on 12/11/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tipDefault: UILabel!
    @IBOutlet weak var viewBackroundSettings: UIImageView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var value  = 0

    
    @IBAction func valueChange(sender: AnyObject) {
        
         value = Int(slider.value)
        tipDefault.text = "\(value)%"
        
        self.userDefaults.setValue(value, forKey: "Tip_Default")
        self.userDefaults.synchronize()
        
        tipDefault.text = "\(value)%"
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            
            
            
                UIView.animateWithDuration(6) { () -> Void in
                    self.viewBackroundSettings.alpha = 0
                    self.viewBackroundSettings.alpha = 1
                
                
            
                
                
            }
            
            self.slider.value = userDefaults.floatForKey("Tip_Default")


        // Do any additional setup after loading the view.
        
        if(self.userDefaults.valueForKey("Tip_Default") != nil){
            value = self.userDefaults.valueForKey("Tip_Default") as! NSInteger
        }
        
        tipDefault.text = "\(value)%"
        
        
    }
    
   // override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?){
        
     //  var secondViewC: ViewController = segue.destinationViewController as! ViewController
     
        
        
    
    //}

   // override func didReceiveMemoryWarning() {
       // super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
  //  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
