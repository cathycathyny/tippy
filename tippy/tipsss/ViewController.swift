//
//  ViewController.swift
//  tipsss
//
//  Created by siqing lee on 11/20/16.
//  Copyright © 2016 siqing lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    @IBOutlet weak var spliteSwitch: UISwitch!
    @IBOutlet weak var spliteView: UIView!
    @IBOutlet weak var spliteNumberLabel: UILabel!
    
    @IBOutlet weak var SpliteStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func tipCalculate(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billAmount.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let each = total / SpliteStepper.value
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPerson.text = String(format: "$%.2f", each)
        
    }
    @IBAction func spliteOn(sender: AnyObject) {
        if spliteSwitch.on == true{
            spliteView.hidden = false
        }else{
            spliteView.hidden = true
        }
    }
    
    @IBAction func updateSplite(sender: AnyObject) {
        spliteNumberLabel.text = Int(SpliteStepper.value).description
        
    }
    

    
    
    

}

